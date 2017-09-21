From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 21 Sep 2017 22:54:30 +0200
Subject: [Buildroot] [PATCH v2 00/11] glibc: bump to 2.26
In-Reply-To: <a4a755be-a98a-e811-fca3-ac711612a829@mind.be>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <a4a755be-a98a-e811-fca3-ac711612a829@mind.be>
Message-ID: <3ed22af9-f9a0-1f6c-b8e8-10d2160927e9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 21/09/2017 ? 12:45, Arnout Vandecappelle a ?crit?:
>  Hi Romain,
> 
> On 02-09-17 22:54, Romain Naour wrote:
>> This series bump glibc to the latest release and allow to remove all
>> local patches! Sadly this new release come with some C++ regressions
>> or changes needed in packages.
> 
>  Either this evening or in the weekend I'd like to start applying part of this
> series. Could you mark the patches that should NOT be applied yet as Changes
> Requested in patchwork?

I'll mark this series as "awaiting upstream" since a patch should be available
in the next days fixing glibc bug 22146 [1].

Since a lot patches are required to be able to use a toolchain build with glibc
2.26 on some architectures (powerpc64le, x86, x86_64), it's safer to stay with
glibc 2.25 for now.

I'll ask upstream if they can release glibc 2.26.1 if all reported issues are fixed.

Also, as reported by Yann, I'll update gcc patches (patch 1 and 2) with the
upstream one.

Best regards,
Romain

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=22146

> 
>  Thanks,
>  Regards,
>  Arnout
> 
