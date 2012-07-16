#ifndef QT_ENVARIABLES_H
#define QT_ENVARIABLES_H

#include "qt_visibility.h"

const char INTERNAL *  qt_internal_get_env_str(const char *envariable);
unsigned long INTERNAL qt_internal_get_env_num(const char   *envariable,
                                               unsigned long dflt,
                                               unsigned long zerodflt);

#endif
/* vim:set expandtab: */
