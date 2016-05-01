From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:09:54 +0200
Subject: [Buildroot] [V4 3/3] dropbear: use libtomath & libtomcrypt
In-Reply-To: <1460300126-11046-3-git-send-email-francois.perrad@gadz.org>
References: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
 <1460300126-11046-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160501230954.781a81f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Apr 2016 16:55:26 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dropbear/0001-fix-linking.patch | 36 +++++++++++++++++++++++++++++++++
>  package/dropbear/Config.in              |  1 +
>  package/dropbear/dropbear.mk            |  2 ++
>  3 files changed, 39 insertions(+)
>  create mode 100644 package/dropbear/0001-fix-linking.patch

Following the feedback from Peter and the discussion you had with him,
I marked this patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
