From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 21:14:07 +0200
Subject: [Buildroot] Help with NodeJS
In-Reply-To: <CAHdaamOs2Tmk6FTCGfodZnhpQ3FvpKm4USCd+XVoWLr2a93q-A@mail.gmail.com>
 (Ernie Carp's message of "Mon, 27 Jul 2020 11:39:41 -0700")
References: <CAHdaamOs2Tmk6FTCGfodZnhpQ3FvpKm4USCd+XVoWLr2a93q-A@mail.gmail.com>
Message-ID: <87y2n4u5xc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ernie" == Ernie Carp <erniecarp2018@gmail.com> writes:

 > Hello All,
 > Using:
 > Using Buildroot Version: 2020.08-git-00103-gc7cd1f0-dirty

I take it you mean 2020.05-git-00103-gc7cd1f0-dirty? The -dirty suffix
means that you have made modifications, what are those?


 > Board: atmel_sama5d27_som1_ek_mmc_dev_defconfig


It works here:

git checkout 2020.05-103-gc7cd1f0370
make atmel_sama5d27_som1_ek_mmc_dev_defconfig
make menuconfig
Target packages->Interpreter languages and scripting->nodejs

-- 
Bye, Peter Korsgaard
