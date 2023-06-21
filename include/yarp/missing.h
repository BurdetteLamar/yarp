#ifndef YARP_MISSING_H
#define YARP_MISSING_H

#include "yarp/defines.h"

#include <ctype.h>
#include <stddef.h>
#include <string.h>

int yp_strncasecmp(const char *string1, const char *string2, size_t length);

#ifndef HAVE_STRNCASECMP
#ifndef strncasecmp
#define strncasecmp yp_strncasecmp
#endif
#endif

#endif
