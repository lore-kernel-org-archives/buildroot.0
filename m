From: chuck.fry@nasa.gov (Fry, Charles R. {Chuck}(ARC-TI)[Stinger Ghaffarian Technologies Inc.
 (SGT Inc.)])
Date: Wed, 22 Aug 2012 13:44:48 -0500
Subject: [Buildroot] Stupid n00b question about U-Boot config
In-Reply-To: <20120822102656.5c528851@skate>
References: <817F82FC-C333-4BC2-9BD9-4ADBB6D313BC@nasa.gov>
 <20120822102656.5c528851@skate>
Message-ID: <8901DA81-DA68-44E5-8E4E-61F0712FD06A@nasa.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you, this is the information I needed!
 -- Chuck
 
On Aug 22, 2012, at 1:26 AM, Thomas Petazzoni wrote:

> Le Tue, 21 Aug 2012 18:41:43 -0500,
> "Fry, Charles R. {Chuck}(ARC-TI)[Stinger Ghaffarian Technologies Inc.
> (SGT Inc.)]" <chuck.fry@nasa.gov> a ?crit :
> 
>> make[1]: Entering directory `/home/cfry/buildroot/buildroot-2012.05/output/build/uboot-2012.04.01'
>> make: *** No rule to make target `at91sam9260ek_config'.  Stop.
> 
> U-Boot does not have a at91sam9260ek configuration. The available
> configuration for this board are:
> 
>  at91sam9260ek_dataflash_cs0
>  at91sam9260ek_dataflash_cs1
>  at91sam9260ek_nandflash
> 
> see boards.cfg in U-Boot source code for the list of available
> configurations.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Chuck Fry
Senior Software Engineer
Dell | Services, Federal Government
Office: 650 604 1882  Mobile: 408 230 2715
M/S 269-1, Building N269/260-7
NASA Ames Research Center
Moffett Field, CA 94035-1000

I do not speak for Dell, SGT, Code TI, or NASA, nor do they speak for me.
