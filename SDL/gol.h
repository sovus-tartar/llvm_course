#ifndef __gol__
#define __gol__

#include "sim.h"

#define COLOR_WHITE (0xFFFFFFFF)
#define COLOR_BLACK (0)
#define ALIVE (1)
#define DEAD (0)

#define FIELD_X_SIZE (SIM_X_SIZE/PIXEL_SIZE)
#define FIELD_Y_SIZE (SIM_Y_SIZE/PIXEL_SIZE)

#define PIXEL_SIZE (8)

void processField(char [][FIELD_Y_SIZE]);
void enterStartConfiguration(char [][FIELD_Y_SIZE]);
char checkNeighbours(char [][FIELD_Y_SIZE], const int, const int);
char countAlive(char [][FIELD_Y_SIZE], const int, const int);
void uploadField(char field[][FIELD_Y_SIZE]);
void fillRealPixels(const int x, const int y, const int color);
int getXCoordinate(const int);
int getYCoordinate(const int);

#endif