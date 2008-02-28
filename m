From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Feb 2008 09:17:28 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: package/libpng
	package/microcom package/ etc...
In-Reply-To: <20080228021343.DF5EA120154@busybox.net> (sjhill@uclibc.org's
	message of "Wed\, 27 Feb 2008 18\:13\:43 -0800 \(PST\)")
References: <20080228021343.DF5EA120154@busybox.net>
Message-ID: <87tzjtxzon.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sjhill" == sjhill  <sjhill@uclibc.org> writes:

 sjhill> Author: sjhill
 sjhill> Date: 2008-02-27 18:13:42 -0800 (Wed, 27 Feb 2008)
 sjhill> New Revision: 21130

 sjhill> Log:

 sjhill> Make sure 'linkage.h' headers are installed. Add hack to
 sjhill> bootstrap newer versions of GCC. Filter out 'gnu99' from
 sjhill> assembly flags. Use the 'headers' target instead of 'pregen'
 sjhill> to prepare for more NPTL integration. Fix broken MTD package
 sjhill> configuration....someone believes in the Klingon release
 sjhill> process apparently. Fix build issues with netplug and
 sjhill> libpng. Fix source path for microcom as original site no
 sjhill> longer exists.

Please don't check in unrelated stuff in the same commit.

-- 
Bye, Peter Korsgaard
