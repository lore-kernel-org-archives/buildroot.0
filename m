From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 14 Mar 2012 13:56:56 +0000
Subject: [Buildroot] [PATCH] fbdump: Make fbdump available only to
 x86/x86_64/arm architectures
In-Reply-To: <20120314125527.5090807b@skate>
References: <1331719334-12874-1-git-send-email-markos.chandras@imgtec.com>
 <20120314113754.17f75aaf@skate> <4F607645.1030603@imgtec.com>
 <20120314120237.55ed7844@skate> <4F60859D.3070404@imgtec.com>
 <20120314125527.5090807b@skate>
Message-ID: <4F60A3A8.9000201@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/2012 11:55 AM, Thomas Petazzoni wrote:

> Le Wed, 14 Mar 2012 11:48:45 +0000,
> Markos Chandras <Markos.Chandras@imgtec.com> a ?crit :
> 
>> Actually I don't think glibc supports ARM at all. From glibc's README file
>>
>> "The GNU C Library supports these configurations for using Linux kernels:
>>
>>     i[34567]86-*-linux-gnu
>>     x86_64-*-linux-gnu
>>     powerpc-*-linux-gnu
>>     powerpc64-*-linux-gnu
>>     s390-*-linux-gnu
>>     s390x-*-linux-gnu
>>     ia64-*-linux-gnu
>>     sparc*-*-linux-gnu
>>     sparc64*-*-linux-gnu"
> 
> It might be in glibc-ports, so that's why you don't see it in the main
> glibc README. But definitely, glibc runs on ARM, PowerPC. Millions of
> devices are using it as we are speaking :-)
> 
> Thomas


Yeah I was talking for the official glibc git tree. I have no idea if
this function is supported in glibc-ports or not.

-- 
markos
