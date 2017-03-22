From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:44:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/ntp: security bump to 4.2.8p10
In-Reply-To: <20170322210313.10299-1-bernd.kuhls@t-online.de>
References: <20170322210313.10299-1-bernd.kuhls@t-online.de>
Message-ID: <20170322224449.5092d4c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 22:03:13 +0100, Bernd Kuhls wrote:
> Changed NTP_SITE to https to circumvent "URL transformed to HTTPS due
> to an HSTS policy" during download.
> 
> For details about the bugs fixed see:
> http://support.ntp.org/bin/view/Main/SecurityNotice#Recent_Vulnerabilities
> http://www.kb.cert.org/vuls/id/633847
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ntp/ntp.hash | 6 +++---
>  package/ntp/ntp.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks. Peter: we want this in the LTS branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
