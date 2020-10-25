From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 11:06:23 +0100
Subject: [Buildroot] [PATCH] package/mosquitto: add support for TLS with
 libressl
In-Reply-To: <20201019085823.10319-1-peter@korsgaard.com>
References: <20201019085823.10319-1-peter@korsgaard.com>
Message-ID: <20201025110623.28ce5a06@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Oct 2020 10:58:23 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> mosquitto nowadays works correctly with libressl, so allow that as the
> openssl backend as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mosquitto/mosquitto.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
