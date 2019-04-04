From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 22:54:16 +0200
Subject: [Buildroot] [PATCH v2 1/1] pkg-autotools-infra: disable NLS for
 the host by default
In-Reply-To: <1554371772-31312-1-git-send-email-email@gmail.com>
References: <1554371772-31312-1-git-send-email-email@gmail.com>
Message-ID: <20190404225416.493cda5b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Apr 2019 12:56:12 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> From: Vadim Kochan <vadim4j@gmail.com>
> 
> There is no need for language translaion feature for the host packages,
> anyway some of them disable it explicitly, so lets do it automatically
> at least for the host-autotools- kind of packages.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
> v2:
>     1) get rid of '--disable-nls-macos' which is not needed at all.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
