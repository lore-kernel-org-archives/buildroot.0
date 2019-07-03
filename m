From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:02:28 +0200
Subject: [Buildroot] [PATCH 1/3] package/libnftnl: bump to version 1.1.3
In-Reply-To: <838be080c94bce93e5da8a5a4266be7a2a92be20.1561983176.git.baruch@tkos.co.il>
References: <838be080c94bce93e5da8a5a4266be7a2a92be20.1561983176.git.baruch@tkos.co.il>
Message-ID: <bac5f180-a5b8-5af6-d512-25bee2fce460@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/07/2019 14:12, Baruch Siach wrote:
> Rebase patch #1.
> 
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Series applied to master, thanks.


>  ...libnftnl_xfree-to-avoid-symbol-namin.patch | 118 ++++++++++--------

 Could you check if this patch is still relevant? Originally, xfree was defined
as a function so it made sense. However, in 1.0.3 it became a define so it
shouldn't be needed anymore...

 Also, is path 2 upstreamable?

 Regards,
 Arnout
