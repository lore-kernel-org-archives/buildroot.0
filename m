From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Jul 2019 14:48:33 +0200
Subject: [Buildroot] [PATCH v4 15/15] package/gcc: enable gcc 9.1 for
 ork1 (openrisc)
In-Reply-To: <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-16-giulio.benetti@micronovasrl.com>
 <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
Message-ID: <d23234b7-5159-aa15-b2e3-91c6552d810f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

Le 13/07/2019 ? 23:24, Arnout Vandecappelle a ?crit?:
> 
> 
> On 20/06/2019 12:07, Giulio Benetti wrote:
>> openrisc support has been added with gcc 9.1.
>> Keep for now the old gcc 5 fork for ork1.
> 
>  So, when will we remove this?

Adding Waldemar in Cc.

Waldemar, I tested gcc 9.1 ork1 backend using qemu_or1k_defconfig, it's ok to
remove the old gcc 5 fork ?
At least, we can remove this fork while removing gcc 5 for the internal toolchain.

> 
>  Same for ARC (GCC 8.x fork) and C-SKY (GCC 6.x fork): they are available in
> GCC9, do we need to keep those old forks?

For ARC and C-SKY we have architectures maintainer, I'll let them remove these
gcc fork.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
