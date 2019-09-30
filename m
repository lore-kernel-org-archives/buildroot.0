From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:32:15 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/libsodium: add config for
 full build
In-Reply-To: <20190930153414.27682-1-adrien@gallouet.fr>
References: <20190930153414.27682-1-adrien@gallouet.fr>
Message-ID: <20190930233215.778388c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 15:34:16 +0000
Adrien Gallou?t <adrien@gallouet.fr> wrote:

> A new option is added to build all functions.
> 
> This option was implicitly used before, so it is activated by default to
> avoid unpleasant surprises.
> 
> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
> ---
> Changes v4 -> v5:
>   - also use --disable-minimal

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
