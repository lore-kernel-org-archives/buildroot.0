From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:40:23 +0100
Subject: [Buildroot] [PATCH 13/28] cairo: do not depend on
	xserver-xorg_server, but on the right library
In-Reply-To: <d47c9dfcd7cb9ea156e84cc5493e0b1ef075215d.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:25 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <d47c9dfcd7cb9ea156e84cc5493e0b1ef075215d.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y5fy2i7s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> cairo is a X client library, so there is no reason for it to build
 Thomas> depend on the X.org server. What Cairo needs is the xlib_libX11
 Thomas> library.

Committed, thanks.

-- 
Bye, Peter Korsgaard
