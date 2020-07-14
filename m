From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:09:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/putty: security bump version to
 0.74
In-Reply-To: <20200630054929.439626-1-bernd.kuhls@t-online.de>
References: <20200630054929.439626-1-bernd.kuhls@t-online.de>
Message-ID: <20200714150935.00052bf5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Jun 2020 07:49:29 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Reformatted hashes, added md5 hash provided by upstream.
> 
> Release notes:
> https://lists.tartarus.org/pipermail/putty-announce/2020/000030.html
> 
> Fixes CVE-2020-14002:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-14002
> 
> Updated license hash due to upstream commits adding copyright holders
> and bumping the copyright year:
> https://git.tartarus.org/?p=simon/putty.git;a=history;f=LICENCE;h=3e1d146289644749b3578f610c74715fa1c6bf0d;hb=HEAD
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/putty/putty.hash | 11 ++++++-----
>  package/putty/putty.mk   |  2 +-
>  2 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
