From: Will Newton <will.newton@gmail.com>
Date: Mon, 10 Nov 2014 10:12:40 +0000
Subject: [Buildroot] [PATCH] toolchain-external: update Linaro toolchains
In-Reply-To: <1415613991-19261-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1415613991-19261-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAFbHwiSrjXBpYrVW+O3NqtZ+aToNaS=UQbeb_Do2n6ym0_6Sjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 10, 2014 at 10:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas,

> Bump the ARM, ARMeb and AArch64 Linaro toolchains from 14.08 to
> 14.09. We can't bump to 14.10, because they completely changed the
> toolchains and they are now completely broken: they switched from
> Crosstool-NG to a new build tool to generate the toolchain, and now
> the sysroot handling is completely borked.

Do you have more details on this? If the new tool is causing problems
for people then we need to address those.

Thanks,
