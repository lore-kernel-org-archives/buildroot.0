From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:27:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd-bootchart: add
 BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS
In-Reply-To: <20190414132437.31071-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 14 Apr 2019 15:24:37 +0200")
References: <20190414132437.31071-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9z36tdx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since commit f93596d8ba82354efb545fe91449627e6c896ce1, systemd is
 > enabled on arc however systemd-bootchart is not available on this
 > architecture so add a BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS from
 > the information retrieved in src/architecture.h

 > Fixes:
 >  - http://autobuild.buildroot.org/results/84fb51212abf99faa2b7a46b8c44c42a3ca1201c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
