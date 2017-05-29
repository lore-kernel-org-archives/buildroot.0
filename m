From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:53:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/mxml: fix download URL
In-Reply-To: <20170528213738.14379-1-bernd.kuhls@t-online.de>
References: <20170528213738.14379-1-bernd.kuhls@t-online.de>
Message-ID: <20170529215305.0aaa12fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 23:37:38 +0200, Bernd Kuhls wrote:
> The project moved to github, the current download URL is broken:
> 
> $ wget -q  http://www.msweet.org/files/project3/mxml-2.10.tar.gz
> $ file mxml-2.10.tar.gz
> mxml-2.10.tar.gz: HTML document, UTF-8 Unicode text, with very long lines
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mxml/mxml.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
