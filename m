From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 10:30:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: bump version
In-Reply-To: <20180911205613.24701-1-bernd.kuhls@t-online.de>
References: <20180911205613.24701-1-bernd.kuhls@t-online.de>
Message-ID: <20180912103042.5e834933@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 22:56:13 +0200, Bernd Kuhls wrote:
> Added license hash.
> 
> This bump includes "ECDSA key types are now explicit"
> https://github.com/libssh2/libssh2/commit/62b825c8afb9e5efb6ea9c05b40b309590249fb6
> 
> which is needed by vlc since
> http://git.videolan.org/?p=vlc.git;a=commitdiff;h=afee1e72a8e08866bbe35d1a57e859cac81052b4
> 
> Fixes
> http://autobuild.buildroot.net/results/579/579e2418e59680ad4bf3dc85f2918457b6221bfa/
> http://autobuild.buildroot.net/results/c73/c7348c442d3f585ace0bc62860f802dc08150776/
> http://autobuild.buildroot.net/results/731/73187b883d7fe14b08a4903b326706c9d1f8b519/
> http://autobuild.buildroot.net/results/f6d/f6d4fca6063c81a8e240fed4db89269e455f057e/
> http://autobuild.buildroot.net/results/371/371f4f017f4a5af0ac6d6a8b1b8276858ad47f75/
> http://autobuild.buildroot.net/results/d6a/d6a3b43211eb740bdebbb339668b854d26e878b7/
> http://autobuild.buildroot.net/results/a05/a0576aeeb57a49958e5229d9ec08f2bd792d48b6/
> http://autobuild.buildroot.net/results/57a/57a9ae2f157183a86fbf1b2cc5cbb38e948690ce/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libssh2/libssh2.hash | 3 ++-
>  package/libssh2/libssh2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
