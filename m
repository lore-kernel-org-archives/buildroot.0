From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Jun 2017 22:55:38 +0200
Subject: [Buildroot] [PATCH] x11r7: xf86-input-tslib: upgrade to 1.0.0
In-Reply-To: <20170514075026.13434-1-martink@posteo.de> (Martin Kepplinger's
 message of "Sun, 14 May 2017 09:50:26 +0200")
References: <20170514075026.13434-1-martink@posteo.de>
Message-ID: <87a85jbjqt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martink@posteo.de> writes:

 > As the update from 0.0.X to 1.0.0 suggests, this is a major update. The driver
 > uses X11's touch API now, instead of motion with button emulation. Furthermore
 > it supports multitouch when a recent version of tslib is installed.

 > It is not backwards compatible for very old versions of the X server. See
 > https://github.com/merge/xf86-input-tslib/releases for some details.

 > Signed-off-by: Martin Kepplinger <martink@posteo.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
