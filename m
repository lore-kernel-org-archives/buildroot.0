From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:36:44 +0100
Subject: [Buildroot] [PATCH v1 3/3] docs: add cmake-package
 _INSTALL_OPTS description
In-Reply-To: <20210118212700.2316-3-ps.report@gmx.net>
References: <20210118212700.2316-1-ps.report@gmx.net>
 <20210118212700.2316-3-ps.report@gmx.net>
Message-ID: <20210118223644.7dfb2fc6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jan 2021 22:27:00 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - why _INSTALL_OPTS and not _INSTALL_HOST_OPTS (besides historically
>     reasons)?

Note that we have the same naming in the autotools-package
infrastructure.

>   - mabe the cmake _INSTALL_OPTS is so seldom used, so not worth
>     an extra doc entry?

I've applied anyway, it's meant to be overridden if needed.

However, why are we using install/fast for the target installation, but
not for the host installation ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
