From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 23:27:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: switch from libmysqlclient
 to mysqlnd
In-Reply-To: <1471971288-4564-1-git-send-email-bos@je-eigen-domein.nl>
References: <1471971288-4564-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20160906232755.242c8ace@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 18:54:48 +0200, Floris Bos wrote:
> The Mysql Native Driver has been the default mysql driver since
> PHP 5.4, but buildroot was still using libmysqlclient.
> 
> Mysqlnd has several advantages such as improved memory management
> and the more favorable PHP licensing terms.
> (can combine it with proprietary PHP extensions like Ioncube
> loader, while libmysqlclient requires commercial licensing if you
> link to it and do not fall under their GPL/FOSS license exception)
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/php/Config.ext | 12 ------------
>  package/php/php.mk     |  6 ++----
>  2 files changed, 2 insertions(+), 16 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
