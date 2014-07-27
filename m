From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 18:21:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: gettextize to match
 the new gettext version
In-Reply-To: <1406475877-9817-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406475877-9817-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140727182129.6eabf856@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 27 Jul 2014 17:44:37 +0200, Bernd Kuhls wrote:
> The gettext macros in the package are from a gettext version older than
> the one we have in Buildroot, so autoreconf fails.
> 
> Run gettextize prior to running autoreconf, like we do in wget.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8dd/8dd6651ce99c0b81497fd285909b2b614009e273/
> http://autobuild.buildroot.net/results/0bb/0bbfddda94ac7f75f74a54157c27de5b4fb3e559/
> http://autobuild.buildroot.net/results/92b/92bcb493619ce4508bc4571cbfc3d5c3bdf49ff4/
> http://autobuild.buildroot.net/results/768/768efd71745c72cec159edaa92e266167629ec5d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
