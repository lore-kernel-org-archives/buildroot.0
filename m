From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 22:53:52 +0200
Subject: [Buildroot] [PATCH v4 05/11] package/llvm: enable ARM
In-Reply-To: <20180329113346.10367-6-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-6-valentin.korenblit@smile.fr>
Message-ID: <20180401225352.236efcc5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Mar 2018 13:33:40 +0200, Valentin Korenblit wrote:
> This patch adds LLVM support for ARM
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>

To be honest, I don't really see why PATCH 05 and PATCH 06 are not
directly part of PATCH 01 introducing llvm. They don't do anything
except adding new architectures in the list.

But that's a minor nit, and it's OK to keep things as-is.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
