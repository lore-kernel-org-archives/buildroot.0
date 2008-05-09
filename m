From: Marc Karasek <Marc.Karasek@Sun.COM>
Date: Fri, 09 May 2008 12:19:07 -0400
Subject: [Buildroot] Toolchain for x86_64 help
Message-ID: <4824797B.8020107@sun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build a x86_64 toolchain on a FC8_64 system.  I am 
working on coreboot, which uses uclibc.  Coreboot was doingthe -nostdlib 
trick to force uclibc to link with it.  I saw that the toolchain 
wrappers were pulled from uclibc in 0.9.22.  Since we are using 0.9.29, 
I thought it might be wise to update the build for coreboot to use a 
full uclibc toolchain. 

Unfortunately,  I can not get buildroot to build on FC8_64.   Does 
anyone know of a configuration that works (gcc, binutils, uclibc, etc..) 
for a x86_64 system?   Has anyone built buildroot on a  FC8_64 system?

Marc

-- 
*********************
Marc Karasek
MTS
Sun Microsystems
mailto:marc.karasek at sun.com
ph:770.360.6415
*********************
