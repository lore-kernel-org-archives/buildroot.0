From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Apr 2019 00:08:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd-bootchart: add
 BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS
In-Reply-To: <20190414132437.31071-1-fontaine.fabrice@gmail.com>
References: <20190414132437.31071-1-fontaine.fabrice@gmail.com>
Message-ID: <866660b5-914e-de71-8413-76edcc3e5355@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2019 15:24, Fabrice Fontaine wrote:
> Since commit f93596d8ba82354efb545fe91449627e6c896ce1, systemd is
> enabled on arc however systemd-bootchart is not available on this
> architecture so add a BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS from
> the information retrieved in src/architecture.h
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/84fb51212abf99faa2b7a46b8c44c42a3ca1201c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both applied to master, thanks.

 Regards,
 Arnout
