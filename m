From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 29 May 2019 09:40:52 +0200
Subject: [Buildroot] libftdi1 licenses
Message-ID: <CAGm1_ktUkdhxROJMqgO5UHaOFf7dmaj2rYVvruOTjay5C8XLnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FOSSology scan reveals that src/ftdi_stream.c contains MIT license.

Some CMake scripts are licensed under LGPL 2.1
(cmake/UseLibFTDI1.cmake). Should this also be mentioned?

 /***************************************************************************
                            ftdi_stream.c  -  description
                               -------------------
      copyright            : (C) 2009 Micah Dowty 2010 Uwe Bonnes
      email                : opensource at intra2net.com
   ***************************************************************************/

  /***************************************************************************
   *                                                                         *
   *   This program is free software; you can redistribute it and/or modify  *
   *   it under the terms of the GNU Lesser General Public License           *
   *   version 2.1 as published by the Free Software Foundation;             *
   *                                                                         *
   ***************************************************************************/

  /* Adapted from
   * fastftdi.c - A minimal FTDI FT232H interface for which supports bit-bang
   *              mode, but focuses on very high-performance support for
   *              synchronous FIFO mode. Requires libusb-1.0
   *
   * Copyright (C) 2009 Micah Dowty
   *
   * Permission is hereby granted, free of charge, to any person
obtaining a copy
   * of this software and associated documentation files (the
"Software"), to deal
   * in the Software without restriction, including without limitation
the rights
   * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   * copies of the Software, and to permit persons to whom the Software is
   * furnished to do so, subject to the following conditions:
   *
   * The above copyright notice and this permission notice shall be included in
   * all copies or substantial portions of the Software.
   *
   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM,
   * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
   * THE SOFTWARE.
   */

Regards,
Yegor
