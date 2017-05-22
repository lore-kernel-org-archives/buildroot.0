From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 22 May 2017 16:14:28 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-05-21
In-Reply-To: <20170522120753.vebsgc6s2fz5fb6a@tarshish>
References: <20170522063013.3FE2A206ED@mail.free-electrons.com>
 <20170522120753.vebsgc6s2fz5fb6a@tarshish>
Message-ID: <8E2EE25B-898A-4D7A-9936-BD2517D6D86A@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

take a look here:
https://github.com/richfelker/musl-cross-make/blob/master/patches/gcc-6.3.0/0010-static-pie-support.diff

best regards
 Waldemar 

> Am 22.05.2017 um 14:07 schrieb Baruch Siach <baruch@tkos.co.il>:
> 
> Hi Waldemar,
> 
>> On Mon, May 22, 2017 at 08:30:13AM +0200, Thomas Petazzoni wrote: 
>>      x86_64 |                 cifs-utils-6.6 | NOK | http://autobuild.buildroot.net/results/d19bcfcfb33cc5f5b082b97bbd5852d479823b97 |     
> 
> In commit 3c93901bcd2 (toolchain: add hidden symbol for PIE support) you 
> mentioned
> 
>  With musl toolchains you might have static PIE support with little
>  patching of gcc.
> 
> What patch of gcc do you refer to? Commit 3c93901bcd2 enables 
> BR2_TOOLCHAIN_SUPPORTS_PIE for musl toolchains unconditionally. But this 
> cifs-utils build failure indicates that there is still an issue with musl and 
> static PIE.
> 
> Any idea?
> 
> Thanks,
> baruch
> 
> -- 
>     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170522/ca8801fc/attachment.html>
