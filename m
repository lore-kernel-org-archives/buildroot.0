From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 22:34:06 +0200
Subject: [Buildroot] [PATCH v2] qt5quickcontrols2: new package
In-Reply-To: <570AB8F9.5060408@mind.be>
References: <1460151190-21021-1-git-send-email-ps.report@gmx.net>
 <570AB8F9.5060408@mind.be>
Message-ID: <20160418223406.6446b0f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Apr 2016 22:35:05 +0200, Arnout Vandecappelle wrote:

> > +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> > +QT5QUICKCONTROLS2_LICENSE = GPLv3 or LGPLv3, GFDLv1.3 (docs)
> 
>   The source files specify GPLv2+ or LGPLv3

Right, but as Julien said, the new modules are supposedly licensed
under GPLv3 or LGPLv3, which is more or less confirmed by the presence
of those two license files in the root directory of the source tree.
Seems like the comment headers were not updated accordingly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
