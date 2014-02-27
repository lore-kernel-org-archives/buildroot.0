From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 27 Feb 2014 13:42:00 -0700
Subject: [Buildroot] Qt5 and gpu-viv-bin-mx6q problem
In-Reply-To: <530F9D1C.7020100@mind.be>
References: <CACP2RPZb4V-hv61+eSq_pAaah8jmzXCFVr7hMN_jR=VzQDzFOA@mail.gmail.com>
 <530F9D1C.7020100@mind.be>
Message-ID: <530FA318.20001@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 02/27/2014 01:16 PM, Arnout Vandecappelle wrote:
> On 02/27/14 09:22, Massimiliano Marretta wrote:
>> Dear,
>>
>> <snip>
 >>
>> - If I use the last buildroot linaro toolchain 4.8-2013.09, the system
>> not start because the kernel is to old ( 3.0.35 ).
>> - If I use the toolchain linaro-4.7-2013.01 the Qt5 qmlscene exit without
>> message and gpu-viv-bin-mx6q examples not start with the message program
>> not found.
>
>   I think that gpu-viv-bin-mx6q are softfp libraries, so they won't work
> with Linaro (hardfp) toolchains. I'm surprised that qt5 builds at all in
> that case...
>
The latest patches (on -next) allow for either hardfp or softfp:

	http://git.buildroot.net/buildroot/commit/package/freescale-imx/gpu-viv-bin-mx6q?h=next&id=b0b72591d74c1a84b8c1b2e1990a2fe1dfe8c4ab

Regards,


Eric
