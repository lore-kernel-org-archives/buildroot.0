From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 19:50:26 +0200
Subject: [Buildroot] [PATCH 1/1] pppd: fix url
In-Reply-To: <1429518139-2337-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1429518139-2337-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20150420195026.5e667671@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear S?bastien Szymanski,

On Mon, 20 Apr 2015 10:22:19 +0200, S?bastien Szymanski wrote:
> Explanation from https://download.samba.org/pub/samba/README.FTP
> 
> Due to bandwidth usage, ftp downloads of Samba from samba.org are no
> longer allowed. Please use one of our many mirror sites at
> http://www.samba.org/ or to directly access the old site via http
> please use http://download.samba.org/samba/ftp/
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/pppd/pppd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
