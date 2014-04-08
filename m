From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 08 Apr 2014 08:52:44 -0300
Subject: [Buildroot] [PATCH] eglibc: bump to version 2.19 SVN R25243
In-Reply-To: <20140407154148.2b35dd34@skate>
References: <1396875879-22199-1-git-send-email-gustavo@zacarias.com.ar>	<20140407152919.2d1147fb@skate>	<5342A9EB.1030801@zacarias.com.ar>
 <20140407154148.2b35dd34@skate>
Message-ID: <5343E30C.1090703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/07/2014 10:41 AM, Thomas Petazzoni wrote:

>> My opinion is that we should just keep it as simple as possible.
>> If there's a special need for some architecture (like microblaze) let it
>> be so, but really unless we know there's some issue or exception i don't
>> think there's much value in keeping multiple versions, specially since
>> *glibc is backwards ABI compatible.
> 
> Fine with me. My impression so far was that for critical components
> such as gcc/binutils/gdb/libc, we were keeping older versions a little
> bit longer to give it some time to test the newer version before
> forcing everyone to upgrade. Surely we need to continue to do this with
> gcc, where most of the 4.x.0 versions are typically broken on at least
> one architecture.

D'oh, eglibc 2.19 is broken for PowerPC SPE ABI.
So it seems we'll do two versions after all.
I'll send a revised patch shortly.
Regards.
