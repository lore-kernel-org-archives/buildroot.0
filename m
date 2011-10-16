From: Jed Evnull <jedevnull@gmail.com>
Date: Sun, 16 Oct 2011 12:24:10 -0400
Subject: [Buildroot] microperl compile fails for arm
Message-ID: <CAFo83mEZiX6BRzN+LY2XAstAqet=rOtQiWd1uv=aU2aCMnsvEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My compile is blowing up when it hits perl. I'm using qemu_arm as a base
config. I dont see a log file but below is a fragment of where things start
to go south. I'm running ubuntu 10.10.  ??


=====
# we need to build a perl for the host just for Errno.pm
(cd /home/jeff/buildroot-2011.08/output/build/perl-5.8.8; ./Configure
-Dcc="/usr/bin/gcc" -de  )

Beginning of configuration questions for perl5.

Checking echo to see how to suppress newlines...
...using \c
The star should be here-->*

First let's make sure your kit is complete.  Checking...
Looks good...


Would you like to see the instructions? [n]

Locating common programs...
awk is in /usr/bin/awk.
cat is in /bin/cat.
chmod is in /bin/chmod.
comm is in /usr/bin/comm.
cp is in /bin/cp.
echo is in /bin/echo.
expr is in /usr/bin/expr.
grep is in /bin/grep.
ls is in /bin/ls.
mkdir is in /bin/mkdir.
rm is in /bin/rm.
sed is in /bin/sed.
sort is in /usr/bin/sort.
touch is in /usr/bin/touch.
tr is in /usr/bin/tr.
uniq is in /usr/bin/uniq.

Don't worry if any of the following aren't found...
I don't see Mcc out there, offhand.
ar is in /usr/bin/ar.
bison is in /usr/bin/bison.
I don't see byacc out there, either.
cpp is in /usr/bin/cpp.
I don't see csh out there, either.
date is in /bin/date.
egrep is in /bin/egrep.
I don't see gmake out there, either.
gzip is in /bin/gzip.
less is in /usr/bin/less.
ln is in /bin/ln.
make is in /usr/bin/make.
more is in /bin/more.
nm is in /usr/bin/nm.
nroff is in /usr/bin/nroff.
pg is in /usr/bin/pg.
test is in /usr/local/bin/test.
uname is in /bin/uname.
zip is in /usr/bin/zip.
Using the test built into your sh.

Checking compatibility between /bin/echo and builtin echo (if any)...
They are not compatible!  You are probably running ksh on a non-USG system.
I'll have to use /bin/echo instead of the builtin, since Bourne shell
doesn't
have echo built in and we may have to run some Bourne shell scripts.  That
means I'll have to use '-n' to suppress newlines now.  Life is ridiculous.

The star should be here-->*

Symbolic links are supported.

Checking how to test for symbolic links...
Your builtin 'test -h' may be broken.
Trying external '/usr/local/bin/test -h'.
External '/usr/local/bin/test -h' is broken, too.
==============
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111016/9735ff4b/attachment.html>
