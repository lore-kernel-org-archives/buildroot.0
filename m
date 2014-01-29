From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 29 Jan 2014 09:44:12 +0000
Subject: [Buildroot] [PATCH v2] valgrind: bump to version 3.9.0
In-Reply-To: <20140128183919.186508cf@skate>
References: <1388680480-58533-1-git-send-email-jezz@sysmic.org>
 <20140128183919.186508cf@skate>
Message-ID: <52E8CD6C.6050906@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/28/2014 05:39 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu,  2 Jan 2014 17:34:40 +0100, J?r?me Pouiller wrote:
>
>> -VALGRIND_VERSION = 3.8.1
>> +VALGRIND_VERSION = 3.9.0
>>   VALGRIND_SITE    = http://valgrind.org/downloads/
>>   VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
>>   VALGRIND_LICENSE = GPLv2 GFDLv1.2
>
> One of the new features of Valgrind 3.9.0 is the addition of MIPS
> support. Maybe it would be good to enable Valgrind on these
> architectures. I'm adding Vincente and Markos in the Cc list, since
> they are our main MIPS contributors. They might probably be interested
> in doing this work, after testing on MIPS hardware.
>
> Best regards,
>
> Thomas
>
Hi Thomas,

I will let you know once we test this.

-- 
markos
