From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:46:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.3.4.8
In-Reply-To: <20180913063054.17971-1-bernd.kuhls@t-online.de>
References: <20180913063054.17971-1-bernd.kuhls@t-online.de>
Message-ID: <20180913204630.0ee4a906@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Thu, 13 Sep 2018 08:30:54 +0200, Bernd Kuhls wrote:
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tor/0001-openssl-libz.patch | 10 +++++-----
>  package/tor/tor.hash                |  2 +-
>  package/tor/tor.mk                  |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

However:

 (1) The description of the 0001-openssl-libz.patch says "remove host
     paths when looking for openssl", but it doesn't do anything like
     that, so it seems like this part of the description is no longer
     relevant.

 (2) It would be good to upstream this. Maybe by adding optional
     support for pkg-config ?

Could you have a look into this ? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
