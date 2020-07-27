From: Ernie Carp <erniecarp2018@gmail.com>
Date: Mon, 27 Jul 2020 14:01:09 -0700
Subject: [Buildroot] Help with NodeJS
In-Reply-To: <87y2n4u5xc.fsf@dell.be.48ers.dk>
References: <CAHdaamOs2Tmk6FTCGfodZnhpQ3FvpKm4USCd+XVoWLr2a93q-A@mail.gmail.com>
 <87y2n4u5xc.fsf@dell.be.48ers.dk>
Message-ID: <CAHdaamNPUUqNEx23d7Od=RkRyu8G8L6uywsaGS+8N21E9-DN8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thanks for reply. When I make menuconfig it says "Buildroot
2020.08-git-00103-gc7cd1f0-dirty Configuration" at the top. I did change
the version of one package so uuid would work when I was having a problem
getting font config to build. I will pull a fresh unpolluted version of BR
and try again.

Thank you,
Ernie.

On Mon, Jul 27, 2020 at 12:14 PM Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Ernie" == Ernie Carp <erniecarp2018@gmail.com> writes:
>
>  > Hello All,
>  > Using:
>  > Using Buildroot Version: 2020.08-git-00103-gc7cd1f0-dirty
>
> I take it you mean 2020.05-git-00103-gc7cd1f0-dirty? The -dirty suffix
> means that you have made modifications, what are those?
>
>
>  > Board: atmel_sama5d27_som1_ek_mmc_dev_defconfig
>
>
> It works here:
>
> git checkout 2020.05-103-gc7cd1f0370
> make atmel_sama5d27_som1_ek_mmc_dev_defconfig
> make menuconfig
> Target packages->Interpreter languages and scripting->nodejs
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200727/1f946dd6/attachment.html>
