From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 12:43:01 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/kodi: Remove hyperflous
 option --disable-dvdcss
In-Reply-To: <1435863053-23943-1-git-send-email-bernd.kuhls@t-online.de>
References: <1435863053-23943-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150704124301.44699629@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu,  2 Jul 2015 20:50:53 +0200, Bernd Kuhls wrote:
> The option is controlled later on inside this if-clause
> 
> ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Rebased local repo against upstream (Yann)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
