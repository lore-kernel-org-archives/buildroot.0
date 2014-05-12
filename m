From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 12:25:48 -0700
Subject: [Buildroot] [PATCH v2 2/2] package/gdb: add gdb 7.7.1
In-Reply-To: <20140512212131.4f83a517@free-electrons.com>
References: <1399842673-21261-1-git-send-email-cody@linux.vnet.ibm.com>
 <1399842673-21261-2-git-send-email-cody@linux.vnet.ibm.com>
 <20140511235400.67d6ac5f@free-electrons.com>
 <53711C15.5010909@linux.vnet.ibm.com>
 <20140512212131.4f83a517@free-electrons.com>
Message-ID: <5371203C.2000206@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/2014 12:21 PM, Thomas Petazzoni wrote:
> Dear Cody P Schafer,
>
> On Mon, 12 May 2014 12:08:05 -0700, Cody P Schafer wrote:
>
>>> I'm not sure we want to jump straight to 7.7 for all architectures.
>>> We're usually a bit conservative with regard to the version of toolchain
>>> components. So I'd suggest instead to add 7.6 and 7.7. Make 7.6 the new
>>> default for all architectures except PPC64, and make 7.6 unavailable
>>> for PPC64, and therefore select 7.7 for PPC64. Of course, all older gdb
>>> versions should be unavailable for PPC64.
>>
>> So long as s/PPC64/PPC64le/, sure.
>
> Right. I guess PPC64 (big endian) has been supported since a long time,
> is this correct?

Yep, ppc64 (big endian) has been around and supported in gcc/glibc/gdb 
for quite a while now (looks like the first gdb support landed in 2007).
