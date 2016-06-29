From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 15:53:04 +0200
Subject: [Buildroot] [PATCH 02/24] sepolgen: drop unused host package
In-Reply-To: <1467207991-4905-3-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <1467207991-4905-3-git-send-email-julien.floret@6wind.com>
Message-ID: <20160629155304.57adb950@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 15:46:09 +0200, Julien Floret wrote:
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
>  package/sepolgen/sepolgen.hash |  2 --
>  package/sepolgen/sepolgen.mk   | 30 ------------------------------
>  2 files changed, 32 deletions(-)
>  delete mode 100644 package/sepolgen/sepolgen.hash
>  delete mode 100644 package/sepolgen/sepolgen.mk

This package is meant to be used in the (near?) future by the refpolicy
stuff needed for SELinux. We should keep it IMO.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
