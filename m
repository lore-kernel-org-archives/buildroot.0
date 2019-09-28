From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:13:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: add upstream security fix
In-Reply-To: <20190928090133.17423-1-bernd.kuhls@t-online.de>
References: <20190928090133.17423-1-bernd.kuhls@t-online.de>
Message-ID: <20190928221344.17406ca2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 11:01:33 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2019-16928:
> https://lists.exim.org/lurker/message/20190928.003428.2b4c81a7.en.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ix-buffer-overflow-in-string_vformat.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
