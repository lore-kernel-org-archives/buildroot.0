From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Feb 2013 23:46:37 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 (Nicolas Dechesne's message of "Mon, 4 Feb 2013 10:44:39 +0100")
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
Message-ID: <87wqun1yuq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Dechesne <ndec13@gmail.com> writes:

 Nicolas> hi there,

 Nicolas> i was wondering if there is any policy regarding how/when X11
 Nicolas> components are being upgraded in BR. at the moment some pieces
 Nicolas> seem a little old (xserver is from b/o 2011, libdrm is from
 Nicolas> e/o 2010...)  perhaps most BR population might not be using
 Nicolas> X11, but i might be wrong.

 Nicolas> i expect that upgrading all x11 components is not a trivial
 Nicolas> task...  and I was thinking that we could at least try to
 Nicolas> bring up all components corresponding to the R7.7 [1] release
 Nicolas> which was done earlier this year...

Our X11 packages were updated to the 7.6 release relatively recently
(September). Any help in updating to 7.7 would be appreciated.

Also see ./support/scripts/xorg-release for an overview of what packages
needs to be updated.

-- 
Bye, Peter Korsgaard
