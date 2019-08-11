From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:59:21 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/collectd: snmp_agent needs netsnmp mib loading
In-Reply-To: <20190806174155.14287-1-fontaine.fabrice@gmail.com>
References: <20190806174155.14287-1-fontaine.fabrice@gmail.com>
Message-ID: <20190811145921.0113df31@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Aug 2019 19:41:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> snmp_agent plugin was added in version 5.8.0 by
> https://github.com/collectd/collectd/commit/8aba9d6e33dea747e4e27e35457f00c287e2c678
> 
> It depends on "struct tree" (from net-snmp/library/parse.h) which is
> included if BR2_PACKAGE_NETSNMP_ENABLE_MIBS is set
> 
> Fix this error by updating configure.ac to check for get_tree in
> addition to init_agent
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3e24a7671e65974815072f92efaa490d2950b3d9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Update title

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
