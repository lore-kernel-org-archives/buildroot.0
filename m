From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:24:34 +0200
Subject: [Buildroot] [PATCH v2] package/ethtool: bump to 5.6
In-Reply-To: <20200603110458.18125-1-matthew.weber@rockwellcollins.com>
References: <20200603110458.18125-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200604232434.4dc35d5d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Jun 2020 06:04:58 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> - Now by default ethtool depends on libmnl so make this optional
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v1 -> v2
> [Thomas
>  - Noted that the libmnl is conditional and the pkgconfig dependency
>    is part of the libmnl being enabled

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
