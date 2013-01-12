From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:52:32 +0100
Subject: [Buildroot] [PATCH 26/28] xvkbd: turn into a generic-package
In-Reply-To: <ce7075376884a3a306aa0df7b35d1f47cb5f72b3.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:38 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <ce7075376884a3a306aa0df7b35d1f47cb5f72b3.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bocu1333.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> xvkbd was integrated has an autotools package, but it does not have a
 Thomas> ./configure script. And to avoid executing the ./configure, the
 Thomas> xvkbd-2.8-makefile.patch was creating a dummy .stamp_configured stamp
 Thomas> file... Ugly.

 Thomas> So, make xvkbd a normal generic package, with BUILD_CMDS and
 Thomas> INSTALL_TARGET_CMDS, and get rid of the crappy part of the patch.

Committed, thanks.

-- 
Bye, Peter Korsgaard
