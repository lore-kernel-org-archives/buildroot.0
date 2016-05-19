From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 May 2016 16:03:59 +0200
Subject: [Buildroot] [PATCH v3 1/2] igmpproxy: uclinux support merged
 upstream
In-Reply-To: <1463661925-56795-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463661925-56795-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160519160359.4fa32ca2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 07:45:24 -0500, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> --
> v2 -> v3
>  - Upstream version bump now contains this feature

Doesn't this patch depends on PATCH 2/2 being applied?

If so, they should be a single patch, otherwise if I apply only this
patch, the build is broken.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
