From: Will Buik <willbuik@gmail.com>
Date: Wed, 22 Nov 2006 14:50:42 -0500
Subject: [Buildroot] Error compiling svn revision 16632.
Message-ID: <1d09f8b80611221150j5f12383fl1f4cb914f9c0d733@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I used svn to checkout the latest revision 16632 and set up default
configuration with make menuconfig, but when trying to compile I
immidatly get the error:
target/cpio/cpioroot.mk:10: *** missing separator.  Stop.
