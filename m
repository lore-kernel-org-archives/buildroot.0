From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 09:46:28 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: cleanup handling of ARC uClibc
 version
In-Reply-To: <1423947668-23312-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423947668-23312-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1423947668-23312-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150220094628.68bae985@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Feb 2015 22:01:05 +0100, Thomas Petazzoni wrote:
> This commit makes the ARC uClibc version handling explicit by adding a
> BR2_UCLIBC_VERSION_ARC_GIT option, rather than only relying on the
> selected architecture. This is needed in preparation to the
> introduction of uClibc-ng support, which also supports the ARC
> architecture: so we will now have two uClibc versions capable of
> handling ARC.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks to Yann's Acked-by, I've applied this patch to the next branch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
