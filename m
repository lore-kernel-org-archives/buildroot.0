From: harshal shete <harshalshete@gmail.com>
Date: Sat, 30 Jun 2007 16:21:45 +0530
Subject: [Buildroot] Help Unable to checkout revision
Message-ID: <b85b23590706300351v614b8de5oecc3b3f7561c71f0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

i am new to tis community,
and by reading the buildroot documentation
i was trying to check out the revision 18957,18958
but it always fails and i am unable to check out that version.

i require that specific version because i am trying to compile this on
cygwin to get the
windows based toolchain.
i have checked out version 17130 and compiled it sucessfully on linux.

but when i tried to compile the same on cygwin it gave me error in
toolchain_build_arm/extra/cinfig/conf.c
as '_libintl_gettext' does not found
when i saw the code in conf.c it actually includes lkc.h and it is
responsible for this

and when i posted it on the list i got response as i should check out and
try version
18957 or above but when i tried to check out that version it fails on so
many locations
with error.
A    buildroot/package/libgtk12
svn: Decompression of svndiff data failed

can somebody tell me how i can compile gcc version 3.4.3 or and gdb 6.5
for arm processor with Target architecture variant as arm926t on cygwin.

has anyone did this before ?
if anyone did then please tell me.
and i am not getting why does check out fails
can somebody explain me both the things?

Thanks and regards
Harshal
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070630/38f08ebe/attachment.htm 
