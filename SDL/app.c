#include "gol.h"

void copyField(const char src[][FIELD_Y_SIZE], char dest[][FIELD_Y_SIZE])
{
  for (int i = 0; i < FIELD_X_SIZE; ++i)
  {
    for (int j = 0; j < FIELD_Y_SIZE; ++j)
    {
      dest[i][j] = src[i][j];
    }
  }
}

void app()
{
  char field[FIELD_X_SIZE][FIELD_Y_SIZE] = {};
  enterStartConfiguration(field);

  for(;;)
  {
    uploadField(field);
    processField(field);
  }

}

void processField(char field[][FIELD_Y_SIZE])
{
  char newField[FIELD_X_SIZE][FIELD_Y_SIZE] = {};

  for(int x = 0; x < FIELD_X_SIZE; ++x)
  {
    for(int y = 0; y < FIELD_Y_SIZE; ++y)
    {
      char pointState = checkNeighbours(field, x, y);
      newField[x][y] = pointState;
    }
  }

  copyField(newField, field);
}

void uploadField(char field[][FIELD_Y_SIZE])
{
  for (int x = 0; x < FIELD_X_SIZE; ++x)
  {
    for (int y = 0; y < FIELD_Y_SIZE; ++y)
    {
      if (field[x][y] == ALIVE)
      {
        fillRealPixels(x, y, COLOR_WHITE);
      }
      else
      {
        fillRealPixels(x, y, COLOR_BLACK);
      }
    }
  }

  simFlush();
}

void fillRealPixels(const int x, const int y, const int color)
{
  int realX = x * PIXEL_SIZE;
  int realY = y * PIXEL_SIZE;

  for (int i = realX; i < realX + PIXEL_SIZE; ++i)
  {
    for (int j = realY; j < realY + PIXEL_SIZE; ++j)
    {
      simPutPixel(i, j, color);
    }
  }

}

void enterStartConfiguration(char field[][FIELD_Y_SIZE])
{
  field[0][0] = ALIVE;
  field[0][1] = DEAD;
  field[0][2] = ALIVE;
  field[1][0] = DEAD;
  field[1][1] = ALIVE;
  field[1][2] = ALIVE;
  field[2][0] = DEAD;
  field[2][1] = ALIVE;
  field[2][2] = DEAD;
}

char checkNeighbours(char field[][FIELD_Y_SIZE], const int x0, const int y0)
{
  int realX0 = getXCoordinate(x0);
  int realY0 = getYCoordinate(y0);

  char ownAlive = field[x0][y0];
  char aliveCounter = countAlive(field, x0, y0);

  if (ownAlive == ALIVE)
  {
    if ((aliveCounter == 2) || (aliveCounter == 3))
    {
      return ALIVE;
    }
    else
    {
      return DEAD;
    }
  }
  else
  {
    if (aliveCounter == 3)
    {
      return ALIVE;
    }
    else
    {
      return DEAD;
    }
  }
}


char countAlive(char field[][FIELD_Y_SIZE], const int x0, const int y0)
{
  char ownAlive = field[x0][y0];
  char aliveCounter = 0 - ownAlive;

  for (int i = -1; i < 2; ++i)
  {
    for (int j = -1; j < 2; ++j)
    {
      int realX = getXCoordinate(x0 + i);
      int realY = getYCoordinate(y0 + j);
      aliveCounter = aliveCounter + field[realX][realY];
    }
  }

  return aliveCounter;


  // return field[getXCoordinate(x0-1)][getYCoordinate(y0-1)] +
  //        field[getXCoordinate(x0-1)][getYCoordinate(y0)] +
  //        field[getXCoordinate(x0-1)][getYCoordinate(y0+1)] +
  //        field[getXCoordinate(x0)][getYCoordinate(y0-1)] +
  //        field[getXCoordinate(x0)][getYCoordinate(y0+1)] +
  //        field[getXCoordinate(x0+1)][getYCoordinate(y0-1)] +
  //        field[getXCoordinate(x0+1)][getYCoordinate(y0)] +
  //        field[getXCoordinate(x0+1)][getYCoordinate(y0+1)];
}

int getXCoordinate(const int x)
{
  if (x < 0)
  {
    return (x + FIELD_X_SIZE) % FIELD_X_SIZE;
  }
  else
  {
    return x % FIELD_X_SIZE;
  }
}

int getYCoordinate(const int y)
{
  if (y < 0)
  {
    return (y + FIELD_Y_SIZE) % FIELD_Y_SIZE;
  }
  else
  {
    return y % FIELD_Y_SIZE;
  }
}