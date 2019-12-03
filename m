From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 3 Dec 2019 13:06:18 +0200
Subject: [Buildroot] [FYI] Bootlin external toolchains
In-Reply-To: <20191203120029.2962bfaa@windsurf>
References: <CAMw6YJLJae0GcmrDmSY8FZ-uMj+WBybPkBaLQC1wkhooCjoKyQ@mail.gmail.com>
 <20191202152601.4ab1c8cd@windsurf>
 <a9c40802-dfd5-67b5-6750-b0711f667280@smile.fr>
 <CAMw6YJKQ-Su+nKYJo3YZyEo5XxdgPEpdj-D22psgqib2dwnv_Q@mail.gmail.com>
 <20191203120029.2962bfaa@windsurf>
Message-ID: <CAMw6YJL=DREwg6HM-xnijK=nhxJGaf4P_Jga+46W2jGBMqmE3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All

On Tue, Dec 3, 2019 at 1:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 3 Dec 2019 12:07:51 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
>
> > May be it would be good to start with generic script which generates
> > br2_fragment by specifying the path to the toolchain ?
>
> Such fragments already exist for each toolchain, for example:
>
>   https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/fragments/aarch64--glibc--stable-2018.11-1.frag
>

Yes, I already used them) I meant, it would be good to have such
script in Buildroot which allows to generate such fragments for any
toolchain.
The existing script which validates the toolchain (during the build
before the installation into the host part) uses some set of checks -
rpc, wchar, threads supporting.
So, it would be good to use such approach for the toolchain fragment
generation. Or such script already exist ?

> Best regards,
>
> Thomas

Regards,
Vadim Kochan
