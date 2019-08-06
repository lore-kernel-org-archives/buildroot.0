From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:31:34 +0200
Subject: [Buildroot] [PATCH v4 1/1] pkg-infra/show-info: dump
 install_{staging, target, images} info
In-Reply-To: <20190806110203.24423-1-vadim4j@gmail.com>
References: <20190806110203.24423-1-vadim4j@gmail.com>
Message-ID: <20190806223134.65c519f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Aug 2019 14:02:03 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> provide info if the package will be installed to staging/target/images
> destinations. Might be useful for analyzing the packages which
> installed for target/staging/images.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---

Applied to master with a reworked commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
