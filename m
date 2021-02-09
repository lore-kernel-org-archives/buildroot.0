From: Andreas Ziegler <br015@umbiko.net>
Date: Tue, 09 Feb 2021 18:38:10 +0000
Subject: [Buildroot] BR2_HOST_GCC_AT_LEAST_4_8 not set but toolchain >
 linaro-7.3-2018.05 !?
In-Reply-To: <CAGshWo3jVrhCNEetBj=xmOJ_PsbEDna7biGaCjVORoSqW7xXeg@mail.gmail.com>
References: <mailman.2252.1612552067.250548.buildroot@busybox.net>
 <acc14f9c1a468562ab695cb5b68edd97@umbiko.net>
 <CAGshWo1TDiuuYmRWOF-=jbxdMkbDeuK6Ukp3fnzvx6PKtbad5A@mail.gmail.com>
 <c65a774ad24c28353560af07596f1a8f@umbiko.net>
 <CAGshWo3jVrhCNEetBj=xmOJ_PsbEDna7biGaCjVORoSqW7xXeg@mail.gmail.com>
Message-ID: <98dbd368a6abb0d4f96754d6f429448f@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Emmanuel

On 2021-02-09 17:38, manu f wrote:

> Sorry Andreas ..

No problem.

> Reason is the initial project was with this version.

You could try a quick port. Export /import your defconfig into a more 
recent Buildroot version. If this builds with less problems, stick with 
the new version, otherwise recreate the original build environment, 
starting with the Linux distribution.

Kind regards,
Andreas
