From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 27 Jan 2018 21:38:59 -0800
Subject: [Buildroot] Compiling gcc for the target?
In-Reply-To: <04e2a7a3-6344-6e78-1aa4-d6fcc9cf02c6@longlandclan.id.au>
References: <45535c2a-31b5-8063-d749-926f7c2f023f@longlandclan.id.au>
 <20180128033001.gf7u5ix6twj7dghu@tarshish>
 <08307c18-be19-dbe5-cefe-428d01f5db80@longlandclan.id.au>
 <CAMo8Bf+=vAWQmx4ciVPD7ZeaN6H4eht1CJr7hWBgKDf1UnMgNg@mail.gmail.com>
 <04e2a7a3-6344-6e78-1aa4-d6fcc9cf02c6@longlandclan.id.au>
Message-ID: <CAMo8Bf+fBXzYTj2DZ_LreJswp8R82GDEn7vNZ=Gt-Nq7XLpTDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 27, 2018 at 9:25 PM, Stuart Longland
<stuartl@longlandclan.id.au> wrote:
> I did try crosstool-ng? it only gave me uClibc or glibc options, not musl.
>
> I'm not sure if maybe there's an experimental branch that supports musl
> or if I missed an option somewhere, but I couldn't get it to oblige.

In current ct-ng LIBC_MUSL has the following dependencies:

Depends on: GEN_CHOICE_LIBC [=y] && !WINDOWS [=n] && !BARE_METAL [=n]
&& EXPERIMENTAL [=y]

-- 
Thanks.
-- Max
