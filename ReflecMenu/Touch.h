#pragma once

#include <stdio.h>
#include <tchar.h>
#include <windows.h>

// Resolution of the display's input
#define GRID_HALF_HORIZONTAL_OVERSCAN 2  // Grid sections that are not over the screen itself
#define HORIZONTAL_RESOLUTION_TRUE 48
#define HORIZONTAL_RESOLUTION_EFFECTIVE (HORIZONTAL_RESOLUTION_TRUE - (2 * GRID_HALF_HORIZONTAL_OVERSCAN))
#define VERTICAL_RESOLUTION 76

class Touch
{
	public:
		Touch();
		~Touch();

		void Tick();
		void GetTouchPosition(double &xp, double &yp) { xp = x; yp = y; };
		bool GetTouchHeld() { return click; }

	private:
		HANDLE OpenSerial( const _TCHAR *arg, int baud );
		bool ValidatePacket();
		void SeparateAxis(bool *horizontal, bool *vertical);
		void GetLikelyClickPosition(bool *horizontal, bool *vertical, double *x, double *y, bool *click);

		HANDLE serial;
		unsigned char packet[22];
		bool click;
		double x, y;
};