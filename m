From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 09:19:50 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/qt5: bump latest version to
 5.9.1
In-Reply-To: <3abfa37d-9376-d7eb-b61d-bd406c02d259@microchip.com>
References: <1499962724-536-1-git-send-email-joshua.henderson@microchip.com>
 <20170719233013.43e0d27b@windsurf>
 <3abfa37d-9376-d7eb-b61d-bd406c02d259@microchip.com>
Message-ID: <20170720091950.55ad7384@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 16:48:46 -0700, Joshua Henderson wrote:

> OK.  I see it on branch qt-bump only currently.  I will keep an eye out.

Gah, I messed up, my bad. Will apply to master right now.

> Also, please do not apply v2 2/2 of this series (add qt5webkit) as I have found
> several build issues with it already.  I'll break that patch off separately now.

Ah, I was about to apply it. One thing to change it to "select
BR2_PACKAGE_WAYLAND" instead of "depends on BR2_PACKAGE_WAYLAND". Can
you fix that up in your next iteration?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
