From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 15:04:22 +0200
Subject: [Buildroot] [PATCH 2/3] package/rt-tests: bump to 1.0
In-Reply-To: <1468522869-3887-2-git-send-email-romain.naour@gmail.com>
References: <1468522869-3887-1-git-send-email-romain.naour@gmail.com>
 <1468522869-3887-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160715150422.5da4a111@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

One quick comment on this patch.

On Thu, 14 Jul 2016 21:01:08 +0200, Romain Naour wrote:

> +Subject: [PATCH 1/2] Fix various minor issues with rt-tests build system

> +Subject: [PATCH 2/2] Fix a build issue with uClibc-ng

Please use "git format-patch -N" when generating patches for Buildroot
packages, in order to avoid the 1/2 and 2/2 specifications. These
specifications very quickly get wrong when we add or remove patches, so
we prefer not to have them.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
