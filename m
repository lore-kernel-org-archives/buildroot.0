From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 14 Mar 2012 11:48:45 +0000
Subject: [Buildroot] [PATCH] fbdump: Make fbdump available only to
 x86/x86_64/arm architectures
In-Reply-To: <20120314120237.55ed7844@skate>
References: <1331719334-12874-1-git-send-email-markos.chandras@imgtec.com>
 <20120314113754.17f75aaf@skate> <4F607645.1030603@imgtec.com>
 <20120314120237.55ed7844@skate>
Message-ID: <4F60859D.3070404@imgtec.com>
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

Actually I don't think glibc supports ARM at all. From glibc's README file

"The GNU C Library supports these configurations for using Linux kernels:

    i[34567]86-*-linux-gnu
    x86_64-*-linux-gnu
    powerpc-*-linux-gnu
    powerpc64-*-linux-gnu
    s390-*-linux-gnu
    s390x-*-linux-gnu
    ia64-*-linux-gnu
    sparc*-*-linux-gnu
    sparc64*-*-linux-gnu"

-- 
markos
