From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 18 May 2016 21:33:07 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <20160517153611.2a3b4199@free-electrons.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <CAHXCMMKDbJFjkLPVqvHAzZPK6OXLRQvGYOGC4SJNN5eLoHwyJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Tue, May 17, 2016 at 3:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Rodrigo, Geoff, Gustavo, Vicente, Gwenhael, Samuel, Yegor, Ben,
> Clayton, Bernd, please see below, there are questions/issues for you.
>
> Note to others: there are also plenty of build failures below with
> nobody assigned. Feel free to pick some of them and investigate. Thanks!
[...]
>>          sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/a5a32e8b18583f0c40da22e735ef5e2ed1e415a6/
>
> Toolchain issue:
>
> /tmp/ccF0zot6.s: Assembler messages:
> /tmp/ccF0zot6.s:19767: Error: pcrel too far
>
> Samuel, can you retry with the latest gcc/binutils version on SH4 and
> see if it fixes the problem?

I've not finished yet to check all configurations, but from the
preliminary results I got so far, it seems that opencv3 for sh4 builds
correctly with gcc-5.3 and gcc-6.1.

This may give some hints for the next sh4 toolchain configuration for the a.b.o.

I let you know when I get the final results.

Regards,

-- 
Samuel
