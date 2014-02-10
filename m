From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 10 Feb 2014 09:21:18 -0500
Subject: [Buildroot] Bugs cleanup (input requested)
In-Reply-To: <CAAXf6LX719WwMSZUGShzANA22z0g+zo5hYNbFYwfHG3ZEGBioQ@mail.gmail.com>
References: <CAAXf6LX719WwMSZUGShzANA22z0g+zo5hYNbFYwfHG3ZEGBioQ@mail.gmail.com>
Message-ID: <CANxTyt4VXu3gBnuUk_RVNwa_cxe6jr+ZDT5Kj9=EwwqMDSeP=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2014 at 5:21 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> https://bugs.busybox.net/show_bug.cgi?id=4454
> There should be simple way to update image, when changing external fs skeleton
>
> This is about changing the custom target skeleton after the first
> build, and then expecting these changes to be applied on the target
> image. This is not something we support, and we propose the post-build
> script / rootfs overlay mechanisms for it.
> So my proposal is also to close this bug as Resolved/Wontfix, if you agree.

The custom skeleton can easily be added to the list rootfs overlays,
as the first overlay.  Seems "Resolved" to me.
