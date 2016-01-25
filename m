From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:36:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/dvbsnoop: fix musl build
In-Reply-To: <1453642679-29490-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453642679-29490-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160125233631.3b4d821b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 14:37:59 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/6fb/6fbe96af007803acfe9deacf26399cb19e5f2b47/
> http://autobuild.buildroot.net/results/be6/be64a45ac158b9057fb3e7ef9b515250acc77187/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dvbsnoop/0001-musl-types-h.patch | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 package/dvbsnoop/0001-musl-types-h.patch

Applied, thanks. Same as for other patches: please submit upstream!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
