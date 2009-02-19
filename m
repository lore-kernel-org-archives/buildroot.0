From: Roeland Van Praet <roelvp@mind.be>
Date: Thu, 19 Feb 2009 11:57:42 +0100
Subject: [Buildroot] VLC media player + some libraries
Message-ID: <1235041062.6377.1.camel@ess-roelvp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I work as an embedded developer and we needed to port the VLC media
player to buildroot in one of our recent projects.
Since this project began some months ago, the buildroot version used is
that of 20081020.
I noticed that VLC is already ported in the current version, though
under the multimedia subfolder, but apparantly it's only a framework.
It has no extra options and from the work I've done I noticed that this
build would fail.

Therefor, I archived my VLC files (with patches), together with 3
additional libraries I ported: ffmpeg, libdc1394 and libmpeg2.
These are no patches for the buildroot sourcetree since the VLC files
moved from package/ to package/multimedia/.

If there is additional information required, please contact me on this
e-mail.

With kind regards,


Roeland Van Praet

Embedded Software Developer
Mind - an ESSENSIUM nv division
Gaston Geenslaan 9 - B 3001 Leuven - Belgium
web : www.mind.be
mail: roelvp at mind.be
tel : +32 16 28 65 34
fax : +32 16 28 65 01 
BE 872 984 063 RPR Leuven
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090219/0cd37bb4/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: vlc.tar.bz2
Type: application/x-bzip-compressed-tar
Size: 4790 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090219/0cd37bb4/attachment-0001.bin>
