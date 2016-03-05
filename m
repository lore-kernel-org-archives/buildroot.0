From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 16:16:32 +0100
Subject: [Buildroot] [PATCH/next 31/31] package/kodi-visualisation-vsxu:
 new package
In-Reply-To: <1456006176-21308-32-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-32-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305161632.60646529@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:36 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-visualisation-vsxu/Config.in                   |  8 ++++++++
>  .../kodi-visualisation-vsxu/kodi-visualisation-vsxu.hash    |  2 ++
>  package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk  | 13 +++++++++++++
>  package/kodi/Config.in                                      |  1 +
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/kodi-visualisation-vsxu/Config.in
>  create mode 100644 package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.hash
>  create mode 100644 package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk

Since this patch depends on vsxu, which has some comments, I've marked
both as "Changes Requested" in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
