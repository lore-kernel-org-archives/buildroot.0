From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 2 Feb 2017 08:18:13 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.22
In-Reply-To: <20170202063519.b5lzlk3wvyjqmzwb@tarshish>
References: <20170202061653.GA20021@waldemar-brodkorb.de>
 <20170202063519.b5lzlk3wvyjqmzwb@tarshish>
Message-ID: <B3A79087-3156-4130-8E18-5351301CE157@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> Am 02.02.2017 um 07:35 schrieb Baruch Siach <baruch@tkos.co.il>:
> 
> Hi Waldemar,
> 
>> On Thu, Feb 02, 2017 at 07:16:53AM +0100, Waldemar Brodkorb wrote:
>> - fixes mips{32,64}r6 support
>> - adds experimental aarch64 support
> 
> Is there any issue blocking enable of uclibc for BR2_aarch64?

No. It is already in my testqueue and I will sent a patch soon.
The testsuite still shows a little bit more than 30 errors, but I think the issues will be resolved in the future.

Best regards
 Waldemar
