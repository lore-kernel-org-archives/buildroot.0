From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 11:11:23 +0200
Subject: [Buildroot] [PATCH v6 5/6] libsepol: bump to version 2.5
In-Reply-To: <1466980753-667-6-git-send-email-Aduskett@gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-6-git-send-email-Aduskett@gmail.com>
Message-ID: <20160701111123.182f6e1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 18:39:12 -0400, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

This new version didn't build with uClibc, due to a missing <stdarg.h>
include. I've added a patch fixing that and applied. In addition, I've
sent the patch to the SELinux developers.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
