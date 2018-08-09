From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:42:00 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/iperf3: bump version to 3.6
In-Reply-To: <20180806190104.9528-1-bernd.kuhls@t-online.de>
References: <20180806190104.9528-1-bernd.kuhls@t-online.de>
Message-ID: <20180809224200.315048c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Aug 2018 21:01:04 +0200, Bernd Kuhls wrote:
> Added license hash, switched _SITE to https.
> 
> Iperf 3.2 added optional ssl support, build-tested with libressl,
> run-time tested with openssl.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/iperf3/iperf3.hash |  6 ++++--
>  package/iperf3/iperf3.mk   | 11 +++++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
