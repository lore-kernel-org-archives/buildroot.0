From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 23 Jan 2009 12:18:28 +0100
Subject: [Buildroot] DirectFB + linux-headers-2.6.28.1 compilation
 problem
In-Reply-To: <fce2a370901230310y63c0ebe3x10e523e10154a96a@mail.gmail.com>
References: <fce2a370901230310y63c0ebe3x10e523e10154a96a@mail.gmail.com>
Message-ID: <1232709508.6350.6.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-01-23 at 13:10 +0200, Ihar Hrachyshka wrote:

> I have the following problem compiling DirectFB with linux-header-2.6.28.1:
> In file included from serialmouse.c:43:
> /home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/include/linux/serial.h:164:
> error: expected specifier-qualifier-list before '__u32'

Yes, I've run into the same problem, but forgot to report it here.
Thanks for pointing out the patch that solves it.


Sven
