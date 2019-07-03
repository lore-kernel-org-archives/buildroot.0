From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 01:01:14 +0200
Subject: [Buildroot] [PATCH] package/mbedtls: bump version to 2.16.2
In-Reply-To: <20190627215437.32571-1-offougajoris@gmail.com>
References: <20190627215437.32571-1-offougajoris@gmail.com>
Message-ID: <209727dc-fe2e-5023-ac48-d31620651363@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/06/2019 23:54, Joris Offouga wrote:
> See changelog: https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.2-and-2.7.11-released
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/7c0/7c09c80a376cf0c4c23a3cf48314806de9251544/
> 
> Also add a patch to fix the build issue by requiring at least
> ARMv6 in addition to the DSP feature.
> 
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

 Just for my info, why is Pierre-Jean's Sob here as well?


 Applied to master, thanks.

 Regards,
 Arnout
