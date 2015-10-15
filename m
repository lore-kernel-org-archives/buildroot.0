From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:40:48 +0200
Subject: [Buildroot] [PATCH] sane-backends: specify explicit path to
 net-snmp-config
In-Reply-To: <1444873066-10450-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444873066-10450-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151015094048.15bc245c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Oct 2015 22:37:46 -0300, Gustavo Zacarias wrote:
> Otherwise if the host distro has net-snmp devel files sane-backends will
> find /usr/bin/net-snmp-config first and the build will break. Fixes:
> http://autobuild.buildroot.net/results/c38/c381c316907964787ebe1a0807399022f15d8158/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sane-backends/sane-backends.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
