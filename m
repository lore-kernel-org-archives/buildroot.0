From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 19 Feb 2009 12:31:30 +0100
Subject: [Buildroot] VLC media player + some libraries
In-Reply-To: <1235041062.6377.1.camel@ess-roelvp>
References: <1235041062.6377.1.camel@ess-roelvp>
Message-ID: <20090219113130.GA1829@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 19, 2009 at 11:57:42AM +0100, Roeland Van Praet wrote:
>Hi,
>
>I work as an embedded developer and we needed to port the VLC media
>player to buildroot in one of our recent projects.
>Since this project began some months ago, the buildroot version used is
>that of 20081020.
>I noticed that VLC is already ported in the current version, though
>under the multimedia subfolder, but apparantly it's only a framework.
>It has no extra options and from the work I've done I noticed that this
>build would fail.

Please provide patches against current svn.
>
>Therefor, I archived my VLC files (with patches), together with 3
>additional libraries I ported: ffmpeg, libdc1394 and libmpeg2.

Please use the infrastructure from package/Makefile.autotools.in.
There are numerous examples on how these new packages look like (
package/multimedia/vlc/vlc.mk for one).

TIA and kind regards,
Bernhard
