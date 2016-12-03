From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2016 16:02:56 +0100
Subject: [Buildroot] [PATCH 2/3] package/zic: bump version to 2016j
In-Reply-To: <1480775787-28111-2-git-send-email-martin@barkynet.com>
References: <1480775787-28111-1-git-send-email-martin@barkynet.com>
 <1480775787-28111-2-git-send-email-martin@barkynet.com>
Message-ID: <20161203160256.60230c0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Dec 2016 14:36:26 +0000, Martin Bark wrote:

> +$(VERISON_DEPS) includes dependencies from tzdata meaning applications
> +such as zic can't build from tzcode on their own.  Remove the dependency
> +to $(VERISON_DEPS) since it is not necessary to check for version updates
> +in released code.  This solves building zic from tzcode without needing
> +tzdata.

Not clear what you mean here. Is this a new problem introduced by
version 2016j ? Could you explain a bit more what's happening ?

Also, there's two times the same typo: VERISON_DEPS -> VERSION_DEPS.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
