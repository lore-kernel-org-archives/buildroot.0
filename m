From: Alexander Dahl <post@lespocky.de>
Date: Sun, 13 Mar 2016 20:28:03 +0100
Subject: [Buildroot] changing sources before patching
Message-ID: <56E5BF43.90507@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

in the fli4l [1] project, we use buildroot as build system, a little
custom stuff on top, but basically it's buildroot. Now Carsten wanted to
make a package for sfftools [2], especially sfftobmp3. The source is
only available from subversion and we need to patch it. The problem we
face is: some files we need to patch (e.g. configure.ac) have CRLF aka
DOS line endings and patch fails then. So we want to convert the line
endings to LF aka unix before patching. Is this possible with buildroot
and how? Or does anyone else has a good idea for an elegant solution to
this problem?

(please keep Carsten and Christoph in Cc)

Greets
Alex

[1] http://www.fli4l.de/
[2] https://sourceforge.net/projects/sfftools/

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160313/8a531e54/attachment.asc>
