From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 20:27:29 +0200
Subject: [Buildroot] [PATCH] tcpreplay: fix static link with libpcap
In-Reply-To: <ef3f0f91b2d7e9505acb768f8ba0362ff133a799.1459275855.git.baruch@tkos.co.il>
References: <ef3f0f91b2d7e9505acb768f8ba0362ff133a799.1459275855.git.baruch@tkos.co.il>
Message-ID: <20160329202729.25ac3677@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 21:24:15 +0300, Baruch Siach wrote:
> The tcpreplay configure script does not look for static libpcap.a unless
> dynamic link is disabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e7e/e7e7744ac0a22eded05f237e40b0cdaeec4ce005/
> http://autobuild.buildroot.net/results/3e3/3e33a67965eb37471ec3303ee26f6a66a82383a2/
> http://autobuild.buildroot.net/results/fff/fff0d6a814b765699cba803ececbc00d77e5d8fc/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/tcpreplay/tcpreplay.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
