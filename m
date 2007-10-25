From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 25 Oct 2007 22:20:30 +0300
Subject: [Buildroot] Dataflash rootfs problems (still)
In-Reply-To: <6090c5eb0710251111q10602768m1b8cd535da8f7765@mail.gmail.com>
References: <6090c5eb0710240920o4e56f66et2c9f1761c97aea4e@mail.gmail.com>	
	<1193243618.4415.6.camel@aeglos.sweden.atmel.com>	
	<6090c5eb0710240954q368b3409k282c02a5e2fcbef4@mail.gmail.com>	
	<471F904A.5050206@promwad.com>	
	<1193266654.4415.21.camel@aeglos.sweden.atmel.com>	
	<6090c5eb0710250917o712570e1u28d1264d4d6bc4f7@mail.gmail.com>	
	<006401c81724$6ccbdba0$7b00000a@atmel.com>	
	<4720E4F0.20701@promwad.com>	
	<6090c5eb0710251058tb87e862sf6ad55fc6a148983@mail.gmail.com>	
	<4720E9ED.8020102@promwad.com>
	<6090c5eb0710251111q10602768m1b8cd535da8f7765@mail.gmail.com>
Message-ID: <4720EC7E.4020701@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jorge,

That is reply for your statement "Kernel 2.6.22 doesn't compile when enabling bitbang"
try vanilla kernel + patch from maxim.org.za - it should compile OK.

BR,
Ivan

Jorge S. wrote:
> Is the site for ARM kernel patches, what to search there?, the only relevant
> thing i see is this annotation on 2.6.23:
> 
> DataFlash (at91_dataflash & mtd_dataflash): Due to a bug, the
> compare-after-write check would never fail. [MicroMax]
> 
> My kernel, of course, is already patched for ARM.
> 
> 2007/10/25, Ivan Kuten <ivan.kuten@promwad.com>:
>>
>>
>> Jorge S. wrote:
>>> Kernel 2.6.22 doesn't compile when enabling bitbang... Ulf suggests
>> using
>>> H/W SPI.... what to do!?
>> check this link:
>> http://maxim.org.za/at91_26.html
>>
>>
>> BR,
>> Ivan
>> --------------------------------
>> Embedded Linux engineer,
>> Promwad Company: http://www.promwad.com/
>> Homepage : http://www.ivankuten.com/
>> --------------------------------
>>
> 


-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
