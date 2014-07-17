From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:35:46 +0200
Subject: [Buildroot] [PATCH 1/1] dcron: provide init script
In-Reply-To: <20140717165814.GB3737@free.fr>
References: <20140715211719.0ea2e053@free-electrons.com>
 <1405589648-26777-1-git-send-email-alvaro.gamez@hazent.com>
 <20140717165814.GB3737@free.fr>
Message-ID: <20140717203546.23fdf26e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Jul 2014 18:58:14 +0200, Yann E. MORIN wrote:

> This should be in a DCRON_INSTALL_INIT_SYSV macro, see:
>     http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems

I'll fix this when applying.

> Also provide the systemd unit file (if it is available in the package!)
> with the DCRON_INSTALL_INIT_SYSTEMD macro.

I don't think there's a systemd unit file for dcron.

However, I remember there was one in the recently added upmpdcli
package, but since I don't know much about systemd, I didn't had
support for it. If anyone feel like adding support for upmpdcli systemd
unit file, don't hesitate to do it :-)

Cheers,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
