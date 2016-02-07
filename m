From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 16:19:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/iucode-tool: bump version to 1.5
In-Reply-To: <1454149489-1093-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454149489-1093-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207161957.124c543f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 11:24:49 +0100, Bernd Kuhls wrote:
> Upstream changed to gitlab.com
> Added hash
> Upstream tarballs contains a working configure script, therefore remove
> autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/iucode-tool/Config.in        | 2 +-
>  package/iucode-tool/iucode-tool.hash | 2 ++
>  package/iucode-tool/iucode-tool.mk   | 6 +++---
>  3 files changed, 6 insertions(+), 4 deletions(-)
>  create mode 100644 package/iucode-tool/iucode-tool.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
