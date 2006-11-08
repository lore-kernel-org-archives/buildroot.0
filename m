From: Ashwin Bihari <abihari@gmail.com>
Date: Wed, 8 Nov 2006 09:32:40 -0500
Subject: [Buildroot] How to add a (toolchain) patch
In-Reply-To: <loom.20061108T150042-738@post.gmane.org>
References: <loom.20061108T150042-738@post.gmane.org>
Message-ID: <1f11a5490611080632o1a1d377bi2a1019916e696220@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/8/06, MikeW <mw_phil@yahoo.co.uk> wrote:
>
> It would appear that I can add a patch file to (e.g.) gcc
> by saving the file in the toolchain/gcc/3.x.y directory.
>
> Is there a file naming requirement, or will any files
> in the directory be applied as patches ?
>
> (I have a patch file which is supposed to fix something, but it
> doesn't appear to be fixed ...)
>
> Regards,
> MikeW
>

Mike,

If you check out the gcc-uclibc-3.x.mk file it indicates that any "*.patch"
file will be applied. So you need only end it with that.

Regards

-- 
~ Ashwin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061108/e8219ed8/attachment.htm 
