From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 1 Aug 2013 01:20:06 +0800
Subject: [Buildroot] [PATCH] uclibc/arm: don't install ldd.host and
 ldconfig.host if !HAVE_SHARED
In-Reply-To: <20130728192227.708e6c2c@skate>
References: <1375030117.13990.1.camel@phoenix> <20130728185932.5142e4b2@skate>
 <CAFRkauAQFyQCn1S=yUuzhCmCNdjMn1jTU-zzgG=eLAL-P7Hy3A@mail.gmail.com>
 <20130728192227.708e6c2c@skate>
Message-ID: <CAFRkauDzZo1-d8jT90MiEcvTYA9_jodhKtDKNSnmXNbt+itEYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> BR2_BINFMT_FLAT should be set when ARM noMMU is used, because I don't
> think ELF binaries are supported on ARM noMMU.
>
> I know Gustavo is working on improving the ARM noMMU, hopefully he will
> post patches soon.
Hi,
I'm still not able to build a FLAT executable.
Just to let you know If there is patch for supporting noMMU available
on the maillist,
I'm happy to test it.

Or is there other projects support building applications for noMMU?
I tried uClinux-dist but got build error. ( And uClinux-dist seems
does not update for a long time.)

Thanks,
Axel
