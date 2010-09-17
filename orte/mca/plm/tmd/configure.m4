# -*- shell-script -*-
#
# Copyright (c) 2004-2005 The Trustees of Indiana University and Indiana
#                         University Research and Technology
#                         Corporation.  All rights reserved.
# Copyright (c) 2004-2005 The University of Tennessee and The University
#                         of Tennessee Research Foundation.  All rights
#                         reserved.
# Copyright (c) 2004-2005 High Performance Computing Center Stuttgart, 
#                         University of Stuttgart.  All rights reserved.
# Copyright (c) 2004-2005 The Regents of the University of California.
#                         All rights reserved.
# Copyright (c) 2009-2010 Cisco Systems, Inc.  All rights reserved.
# $COPYRIGHT$
# 
# Additional copyrights may follow
# 
# $HEADER$
#

# MCA_plm_tmd_CONFIG([action-if-found], [action-if-not-found])
# -----------------------------------------------------------
AC_DEFUN([MCA_orte_plm_tmd_CONFIG],[
    AC_CONFIG_FILES([orte/mca/plm/tmd/Makefile])

    ORTE_CHECK_TM([plm_tmd], [plm_tmd_good=1], [plm_tmd_good=0])
         
    # if check worked, set wrapper flags if so.  
    # Evaluate succeed / fail
    AS_IF([test "$plm_tmd_good" = "1"],
          [plm_tmd_WRAPPER_EXTRA_LDFLAGS="$plm_tmd_LDFLAGS"
           plm_tmd_WRAPPER_EXTRA_LIBS="$plm_tmd_LIBS"
           $1],
          [$2])

    # set build flags to use in makefile
    AC_SUBST([plm_tmd_CPPFLAGS])
    AC_SUBST([plm_tmd_LDFLAGS])
    AC_SUBST([plm_tmd_LIBS])
])dnl
