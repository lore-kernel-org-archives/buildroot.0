From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 21:04:01 +0100
Subject: [Buildroot] [PATCH 1/1] tekui: disable parallel build
In-Reply-To: <20190120180922.16105-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 20 Jan 2019 19:09:22 +0100")
References: <20190120180922.16105-1-fontaine.fabrice@gmail.com>
Message-ID: <87sgxnxfim.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > It seems tekui has parallel build issues since November 2017:
 >  - Fatal error: can't create build/posix/directfb_lua.lo: No such file or directory
 >  - /home/peko/autobuild/instance-3/output/host/bin/microblazeel-buildroot-linux-uclibc-ar: ../../lib/posix/libtekdebug.a: No such file or directory
 >  - Fatal error: can't create build/posix/visual_mod.lo: No such file or directory

 > So disable parallel build

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0732568fcbaa6829154fa91c352b52f074384df0
 >  - http://autobuild.buildroot.org/results/580593e79bc4ecdea1dc71d16607e5c88f87403c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
