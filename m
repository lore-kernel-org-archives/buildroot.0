From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 20:35:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/snowball-init: use github helper
In-Reply-To: <1454257933-24422-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454257933-24422-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131203506.7932d55c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 17:32:13 +0100, Bernd Kuhls wrote:
> Otherwise download is broken:
> 
> >>> snowball-init b064be21de25729039e5e54037bbdd2e25cfd5b7 Downloading
> --2016-01-31 17:31:27--  https://github.com/igloocommunity/snowball-init/snowball-init-b064be21de25729039e5e54037bbdd2e25cfd5b7.tar.gz
> Resolving github.com (github.com)... 192.30.252.128
> Connecting to github.com (github.com)|192.30.252.128|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2016-01-31 17:31:27 ERROR 404: Not Found.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/snowball-init/snowball-init.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
