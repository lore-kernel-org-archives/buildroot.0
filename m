From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:59:39 +0200
Subject: [Buildroot] [PATCH] ntp: properly select/filter netsnmp for
 ntpsnmpd
In-Reply-To: <1405558069-7023-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405558069-7023-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140717095939.2ce10fcc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 16 Jul 2014 21:47:49 -0300, Gustavo Zacarias wrote:
> BR2_PACKAGE_NTP_SNMPD was pushing netsnmp into dependencies but was
> never selected, and since netsnmp requires fork it wasn't filtered out
> for nommu. Fixes:
> 
> http://autobuild.buildroot.net/results/776/7769afe0da09e3f4f96d9a0f4c0febb0c72cc34f/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ntp/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
