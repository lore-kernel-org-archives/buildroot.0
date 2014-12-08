From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 8 Dec 2014 20:11:27 +0100
Subject: [Buildroot] python libraries and x86_64 distribution
Message-ID: <20141208201127.4ea79391@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've compiled buildroot with the support of python-pygame for a ARM32 based
board. When I launch an application using this library the message bellow is
produced.

python: symbol 'Py_InitModule4_64': can't resolve symbol
Traceback (most recent call last):
  File "freqshow.py", line 28, in <module>
    import pygame
  File "/usr/lib64/python2.7/site-packages/pygame/__init__.py", line 99, in
<module> from pygame.base import *
ImportError: unknown dlopen() error

My distribution is an gentoo 64 bit.

Has someone already have this problem?

Thank you

Gwen
