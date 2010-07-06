From: Dmytro Milinevskyy <milinevskyy@gmail.com>
Date: Tue, 6 Jul 2010 18:58:02 +0300
Subject: [Buildroot] [PATCH 0/2] skeleton reorganization patchset
In-Reply-To: <20100617230209.5274a34a@surf>
References: <4c1933c5.0b4ddf0a.0de4.6a7a@mx.google.com>
	<20100617230209.5274a34a@surf>
Message-ID: <AANLkTiluhTWCJ80AeuQrDzlKIGbYrZrMl_yjwZ79C8IH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Any chance to see this in mainline?

-- Dima

On Fri, Jun 18, 2010 at 12:02 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Wed, 16 Jun 2010 23:25:09 +0300
> Dmytro Milinevskyy <milinevskyy@gmail.com> wrote:
>
>> This is a patchset for the reorganization of target rootfs skeleton.
>> First one moves target/generic/target_skeleton to fs/skeleton, makes it default and drops busybox skeleton
>> Second patch adds option to define path to detault skeleton used for the build
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
