From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:02:42 +0100
Subject: [Buildroot] [PATCH] Enabling static libraries build for netsnmp
 package
In-Reply-To: <528A2BFA.4040102@gmx.de>
References: <528A2BFA.4040102@gmx.de>
Message-ID: <20131225180242.30061497@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear universe II,

On Mon, 18 Nov 2013 16:02:18 +0100, universe II wrote:
> As many embedded SW systems do no allow usage of shared libraries, I was 
> wondering why the netsnmp package creates shared libraries only. The 
> following patch enables the generation of static libraries additionally 
> to the shared ones.

Thanks, applied, after adjusting the commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
