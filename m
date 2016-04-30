From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:55:45 +0200
Subject: [Buildroot] [PATCH] opkg: add missing dependency on libarchive
In-Reply-To: <1461952778-12479-1-git-send-email-patrickdepinguin@gmail.com>
References: <1461952778-12479-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160430145545.3f82ef87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 19:59:38 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> opkg requires libarchive. This was expressed in the Config.in file with a
> select, but not in the .mk file.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  package/opkg/opkg.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
