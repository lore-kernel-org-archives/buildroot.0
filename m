From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 22 Dec 2016 11:23:12 +1300
Subject: [Buildroot] Altera socdk defconfig no longer builds
In-Reply-To: <87eg112b2f.fsf@dell.be.48ers.dk>
References: <87eg112b2f.fsf@dell.be.48ers.dk>
Message-ID: <CAE21AQrRuDzoZFXgL7WzLiZ3SqM4arzXAy=udNUgSXe4Ko2=AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 22, 2016 at 11:04 AM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> Hi,
>
> Back in 2015, you contributed altera_socdk_defconfig to Buildroot.
> Unfortunately, this defconfig no longer builds: the Linux kernel
> version used is too old to build with gcc 5.x.
>
> Do you still have access to this HW platform? If so, can you contribute
> a patch to update the defconfig? If you're no longer interested by this
> platform, we can also decide to remove its defconfig.
>
> https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/185616883
>
> You need to move to kernel 3.18+ for compatibility with gcc5.x or
> alternatively backport this commit (and any dependencies):
>
> Thanks Peter

I still have this device in storage somewhere though I have not used it for
at least 15 months.

I will try to sort out a patch sometime over the Christmas break.

-- Charles
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161222/b270cd89/attachment.html>
