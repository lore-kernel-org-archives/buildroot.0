From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:30:58 +0200
Subject: [Buildroot] [PATCH] package/linuxptp: security bump version to
 3.1.1
In-Reply-To: <20210706091500.3236-1-heiko.thiery@gmail.com>
References: <20210706091500.3236-1-heiko.thiery@gmail.com>
Message-ID: <20210716233058.26b0ed6c@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue,  6 Jul 2021 11:15:01 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> This fixes the following CVEs:
>  - CVE-2021-3570 linuxptp: missing length check of forwarded messages
>  - CVE-2021-3571 linuxptp: wrong length of one-step follow-up in transparent clock
> 
> See mailing list post for details: https://sourceforge.net/p/linuxptp/mailman/message/37315519/
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/linuxptp/linuxptp.hash | 8 ++++----
>  package/linuxptp/linuxptp.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
