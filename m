From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 26 Feb 2020 09:24:02 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_HOST_GCC_AT_LEAST_9
In-Reply-To: <20200225232303.1cad5408@windsurf>
References: <20200225212213.22680-1-romain.naour@smile.fr>
 <20200225232303.1cad5408@windsurf>
Message-ID: <39ab8651-6586-0fbf-39f9-874b51df36c4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 25/02/2020 ? 23:23, Thomas Petazzoni a ?crit?:
> On Tue, 25 Feb 2020 22:22:13 +0100
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> Fedora 30 switched to GCC 9.x. [1]
>>
>> [1] https://fedoraproject.org/wiki/Changes/GCC9
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> 
> Thanks, but this was not sufficiently tested it seems: on my Fedora
> system with gcc 9.x, BR2_HOST_GCC_VERSION was still 8, and therefore
> BR2_HOST_GCC_AT_LEAST_9 was not "y". This is because the main Buildroot
> Makefile HOSTCC_MAX_VERSION variable needs to be updated as well.
> 
> I fixed that up and applied to master. Thanks!

Sorry for that.

I was looking at [1] at the same time (that is why I noticed this symbol was
missing).

[1] https://bugs.busybox.net/show_bug.cgi?id=12581

Best regards,
Romain


> 
> Best regards,
> 
> Thomas
> 
