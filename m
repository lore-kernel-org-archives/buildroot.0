From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:59:24 +0100
Subject: [Buildroot] [PATCH v13 4/8] util-linux: selinux, audit,
 and pam support
In-Reply-To: <1477423570-15694-4-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1477423570-15694-4-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <20170310225924.4a16eb48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 14:26:06 -0500, Bryce Ferguson wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> This patch adds optional libselinux ,audit and pam support to linux utilities.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

Instead of this patch, we have applied commit
373b7efdb308fcb7607cbef63ee4d2644b46136f, which serves the same
purpose. So I've marked this patch as Rejected in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
