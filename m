From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 27 Sep 2007 09:15:49 -0400
Subject: [Buildroot] GNU BInutils and TeXinfo v. 4.11
Message-ID: <bcba51a0709270615h7ea93708t3325264e73ea3c38@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Are there any plans to address the issue with incorrect TeXinfo
version detection by GNU binutils toplevel configure script? See e. g.

http://www.nabble.com/makeinfo-version-checking-t4440877.html

It seems to be only in CVS at the moment, from the changelog:

http://sourceware.org/cgi-bin/cvsweb.cgi/src/ChangeLog?rev=1.763&content-type=text/x-cvsweb-markup&cvsroot=src

=========================================
2007-09-15  Alan Modra  <amodra@bigpond.net.au>

        * configure.ac: Correct makeinfo version check.
        * configure: Regenerate.
=========================================


Thanks.

-- 
Dimitry Golubovsky

Anywhere on the Web
