From: Sven Neumann <s.neumann@phase-zero.de>
Date: Wed, 21 Jan 2009 16:04:54 +0100
Subject: [Buildroot] DirectFB fetch problem (no tarball on the primary
 mirror)
In-Reply-To: <fce2a370901210657q3f62fe85r642d9171b328876@mail.gmail.com>
References: <fce2a370901210657q3f62fe85r642d9171b328876@mail.gmail.com>
Message-ID: <1232550294.6326.12.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-01-21 at 16:57 +0200, Ihar Hrachyshka wrote:
> Hello guys!
> I have a problem building the image with DirectFB because it can't
> fetch the source tarball from the mirror (no such file there). It
> seems that DirectFB was updated by upstream from 1.2.6 to 1.2.7 and
> then upstream developers removed the source tarball for previous
> version from their repo. I think we should update the DirectFB version
> to 1.2.7 because it's basically a bug fix release.

The 1.2.6 tarball can be found at
http://directfb.org/downloads/Old/DirectFB-1.2.6.tar.gz

But I agree that buildroot should update to version 1.2.7.


Sven
