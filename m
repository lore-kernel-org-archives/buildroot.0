From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:37:42 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: do not force
 -I/usr/include in CPPFLAGS
In-Reply-To: <1411297275-6888-1-git-send-email-yann.morin.1998@free.fr>
References: <1411297275-6888-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140921193742.2f551f22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 21 Sep 2014 13:01:15 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.net/results/447/4473d8a99ffec1fde491d172520e86ae1e69fae7/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../openvmtools-04-dont-force-cppflags.patch       | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 package/openvmtools/openvmtools-04-dont-force-cppflags.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
