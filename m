From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Fri, 7 Feb 2014 09:45:50 +0100
Subject: [Buildroot] [PATCH v3 4/4] beaglebone: change to zImage
In-Reply-To: <046952e3-d76e-400b-916b-a8fbd069a03b@email.android.com>
References: <1391717684-4244-1-git-send-email-anders@chargestorm.se>
 <1391717684-4244-5-git-send-email-anders@chargestorm.se>
 <CALq67GBCrOGh_yxzjqcVXtUzoox=AEJaYJL27_UObB8qVMNyow@mail.gmail.com>
 <046952e3-d76e-400b-916b-a8fbd069a03b@email.android.com>
Message-ID: <CALq67GDcAe-RwdeihtmOJC_jSWcHxDJYJvEGGwmpYLZOTsmqUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anders,

On Fri, Feb 7, 2014 at 6:59 AM, Anders Darander <anders@chargestorm.se> wrote:
>
> What do other dev's think about this? It doesn't really matter to me if
> I squash then or not.
>
> My reasoning was that of you kept the old U-Boot environment, the
> new U-Boot works with a uImage. That's basically why I kept it as
> separate patches.

My original thinking was since the default U-Boot environment (in the
board file) was being changed to use zImage with version bump, you
should change the kernel image to be zImage in the same patch. I did
not think of this use case when I quickly looked over this change. So
I'm OK with keeping this separate.

Thanks,
-Ryan
