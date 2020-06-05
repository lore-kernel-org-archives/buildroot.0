From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 5 Jun 2020 08:03:51 +0200
Subject: [Buildroot] [PATCH v3] package/edid-decode: bump version to
 1889504
In-Reply-To: <20200603104713.21191-1-ps.report@gmx.net>
References: <20200603104713.21191-1-ps.report@gmx.net>
Message-ID: <20200605080351.6edb369c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Jun 2020 12:47:13 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - edid-decode changed from C to C++, adjust make command
>   accordingly and add BR2_INSTALL_LIBSTDCPP dependency
> 
> - now shipping a LICENSE file, change from (gone) edid-decode.c to this one
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add BR2_INSTALL_LIBSTDCPP dependency (suggestd by Thomas Petazzoni)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
