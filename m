From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 14 Mar 2012 11:33:21 +0000
Subject: [Buildroot] [PATCH] fbdump: Make fbdump available only to
 x86/x86_64/arm architectures
In-Reply-To: <20120314120237.55ed7844@skate>
References: <1331719334-12874-1-git-send-email-markos.chandras@imgtec.com>
 <20120314113754.17f75aaf@skate> <4F607645.1030603@imgtec.com>
 <20120314120237.55ed7844@skate>
Message-ID: <4F608201.4080205@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/2012 11:02 AM, Thomas Petazzoni wrote:

> Le Wed, 14 Mar 2012 10:43:17 +0000,
> Markos Chandras <Markos.Chandras@imgtec.com> a ?crit :
> 
>> Thanks for your suggestion. I fixed and resent my patch.
> 
> And what about my question about ioperm() on ARM?
> 
> Thomas

Sorry I overlooked your question. Yes it seems this is the case. I
didn't actually test that but I grep'd the glibc git tree and I see that
it is not defined for ARM.

-- 
markos
