From: Ossy <ossy1980@gmx.net>
Date: Tue, 13 Jul 2010 21:27:52 +0200
Subject: [Buildroot] Problems with custom config of kernel 2.6.34.1
In-Reply-To: <000f01cb226b$51f11430$f5d33c90$@pauljones.id.au>
References: <4C3B80A7.1040305@gmx.net> <20100713085516.5a5c8d26@surf>
	<000f01cb226b$51f11430$f5d33c90$@pauljones.id.au>
Message-ID: <4C3CBE38.2010400@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 13.07.2010 11:11, schrieb Paul Jones:
>>> I use the kernel version 2.6.33.6 without any problems. But since I
>>> updated to the newer version 2.6.34.1 I'm not able to use a custom
>>> config anymore.
>>>
>>> I loaded the old config into the kernel menuconfig and stored it as
>>> new file linux-2.6.34.1.config. When I launched the overall make
>>> process the kernel patches were applied fine, but the process runs
>>> into text mode configuration:
>>
>> Thanks for your report. Could you provide a step-by-step procedure to
>> reproduce the problem from scratch ?
I changed the brconfig from kernel 2.6.33.x to 2.6.34.x. I loaded my 
custom kernel configuration into the linux menuconfig and stored it as 
new file. Obviously this not sufficient to migrate from one config 
version to another (I remember once in time it was, maybe 2.4.x days?).

>
> Isn't that just make oldconfig running? What happens if you press enter to
> give the default answer to every question?
Paul is absolutly right. I gave the default answer to every question 
(only a few...) and wrote this config back to 
mycustomlinuxconf-2.6.34.x.config.

The next time I do not expect to answer questions on the commandline 
during overall make process.

Thanks both for your help.

Regards,
Marcus

@Thomas: Please note my patch for making u-boot (correcting two typos) 
from 7.7.2010 . The fix is very straight forward (only two changed lines).
