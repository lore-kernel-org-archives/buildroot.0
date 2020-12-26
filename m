From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:28:45 +0100
Subject: [Buildroot] [PATCH 1/3] package/dhcpcd: enhance syntax
In-Reply-To: <20201226171745.2414764-1-fontaine.fabrice@gmail.com>
References: <20201226171745.2414764-1-fontaine.fabrice@gmail.com>
Message-ID: <20201226182845.3c076cdb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Dec 2020 18:17:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add all configure options through DHCP_CONFIG_OPTS and avoid splitting
> lines when they are less than 80 characters
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dhcpcd/dhcpcd.mk | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
