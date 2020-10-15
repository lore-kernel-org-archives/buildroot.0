From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 13:53:54 +0200
Subject: [Buildroot] [PATCH] configs/kontron_smarc_sal28: pin kernel
 version to 5.9
In-Reply-To: <20201015073954.1413-1-michael@walle.cc>
References: <20201015073954.1413-1-michael@walle.cc>
Message-ID: <20201015135354.0a941cc4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 09:39:54 +0200
Michael Walle <michael@walle.cc> wrote:

> Use a fixed kernel version to have a reproducible and tested
> configuration.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  configs/kontron_smarc_sal28_defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
