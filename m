From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 23:40:17 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch yem-misc
In-Reply-To: <cover.1362693141.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 7 Mar 2013 22:53:39 +0100")
References: <cover.1362693141.git.yann.morin.1998@free.fr>
Message-ID: <87k3pevpym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Hello All!
 Yann> This series is a based on Richard's tzdata initial series, with some fixes
 Yann> discussed during the Developper's Day.

 Yann> Changes v1 -> v2:
 Yann>   -  rebased on master

 Yann> Changes since Richard's post -> v1:
 Yann>   - install POSIX time zones only once
 Yann>   - path to 'zic' is exported by the 'zic' package

 Yann> The following changes since commit 203c30796e232faaf3a7de19090657bf3e7db16a:

 Yann>   rpi-userland: provides OpenGL ES, EGL and OpenVG (2013-03-06 22:18:39 +0100)

 Yann> are available in the git repository at:
 Yann>   git://gitorious.org/buildroot/buildroot.git yem-misc

 Yann> Richard Braun (2):
 Yann>       package/zic: new host package
 Yann>       package/tzdata: new package

Committed both, thanks.

-- 
Bye, Peter Korsgaard
