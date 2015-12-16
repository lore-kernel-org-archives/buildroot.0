From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 22:12:29 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libhdhomerun: new package
In-Reply-To: <1450013963-32728-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450013963-32728-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151216221229.4e7abec6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Dec 2015 14:39:23 +0100, Bernd Kuhls wrote:
> Needed for new kodi-pvr-hdhomerun package.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: do not install hdhomerun_config on target anymore (Baruch)

Applied, thanks. I've just added the use of TARGET_MAKE_ENV, and did
some other minor tweaks (rewrap Config.in help text, etc.).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
