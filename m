From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Jun 2016 13:05:35 +0100
Subject: [Buildroot] [PATCH v6] openblas: new package
In-Reply-To: <20160621135137.45246fb7@free-electrons.com>
References: <1466441142-52096-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160621135137.45246fb7@free-electrons.com>
Message-ID: <57692D8F.4010101@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
On 21/06/16 12:51, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 20 Jun 2016 17:45:42 +0100, Vicente Olivert Riera wrote:
> 
>> +	default "ARMV7"        if BR2_cortex_a5 || BR2_cortex_a7 || \
>> +	                          BR2_cortex_a8 || BR2_cortex_a9 || \
>> +				  BR2_cortex_a12 || BR2_cortex_a17
> 
> You can use BR2_ARM_CPU_ARMV7A instead here.

I'll do it, thanks!

Regards,

Vincent.

> 
> Thomas
> 
