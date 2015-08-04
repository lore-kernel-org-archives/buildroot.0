From: DATACOM - Farina <farina@datacom.ind.br>
Date: Tue, 04 Aug 2015 11:23:06 -0300
Subject: [Buildroot] [PATCH 1/1] python-colorama: new package
In-Reply-To: <20150804153825.3a46c00e@free-electrons.com>
References: <1438634219-22000-1-git-send-email-farina@datacom.ind.br>	<20150804105537.3a5e47f6@free-electrons.com>	<55C0BEC6.8040207@datacom.ind.br>
 <20150804153825.3a46c00e@free-electrons.com>
Message-ID: <55C0CACA.4010105@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 04-08-2015 10:38, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 04 Aug 2015 10:31:50 -0300, DATACOM - Farina wrote:
>
>>> Do you intend to submit some packages that will use
>>> host-python-colorama?
>>
>> At this specific moment, no. But we are analyzing the ARM mbed package,
>> which are widely used libraries and tools for ARM microcontrollers, and
>> makes use of host-python-colorama on its build-system.
>
> But why do you use Buildroot to build something for a micro-controller?
> I don't really see the connection between using ARM mbed and Buildroot.
>

Our boards has PowerPC/ARM/MIPS running Linux. And also has ARM 
microcontrollers.

So, when we build the main firmware (Linux + rootfs) with Buildroot, we 
also build the microcontroller firmware that goes inside the rootfs 
(using a secondary toolchain).

With this way, we have just one build-system (Buildroot), with 
everything we need integrated on it.

My apologies if it is not the Buildroot idea, but this kind of 
integration is facilitating our work.

Cheers,

-- 
Augusto Farina
DATACOM / R&D - Access
www.datacom.ind.br
