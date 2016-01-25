From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:35:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/w_scan: fix musl build
In-Reply-To: <1453640947-2780-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453640947-2780-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160125233556.19e24fa0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 14:09:07 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d49/d497c0b23b7f905605f1764c136a9d7682e8137e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/w_scan/0001-musl.patch | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/w_scan/0001-musl.patch

Applied, thanks. Please don't forget to submit the patch upstream.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
