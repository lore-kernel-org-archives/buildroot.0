From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 31 Oct 2018 11:35:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-30
In-Reply-To: <20181031070025.BCA5220736@mail.bootlin.com>
References: <20181031070025.BCA5220736@mail.bootlin.com>
Message-ID: <20181031113538.GE6241@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 31 Oct 2018 08:00:25 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
 
> [...]
>
> Detail of failures
> ------------------
>
> [...]
>
>       mipsel |               webkitgtk-2.22.2 | NOK | http://autobuild.buildroot.net/results/39eae49f4acd54edd3691bc2ee7bf3ee9914b3d8 |     

The WebKitGTK+ build failure has the same cause as other recent similar
ones related to the CMake configuration assuming (not always correctly)
that GStreamer-GL must be available of OpenGL support is enabled. This
build failure would be fixed by the following patch:

   https://patchwork.ozlabs.org/patch/988847/

Cheers,

-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181031/13daf37f/attachment.asc>
