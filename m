From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:55:18 +0100
Subject: [Buildroot] [PATCH v2 2/5] package/rpm: add gettext dependency
In-Reply-To: <1421610790-18508-2-git-send-email-romain.naour@openwide.fr>
References: <1421610790-18508-1-git-send-email-romain.naour@openwide.fr>
 <1421610790-18508-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150201225518.30abf441@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 18 Jan 2015 20:53:07 +0100, Romain Naour wrote:
> rpm check for libintl library if BR2_NEEDS_GETTEXT_IF_LOCALE is set.
> 
> checking for GNU gettext in libintl... yes
> checking whether to use NLS... yes
> checking where the gettext function comes from... external libintl
> checking how to link with libintl... -lintl
> 
> But the dependency on gettext package is missing to ensures
> reproducible builds.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: selected packages are already sorted by the first
>     patch. (Yann E. MORIN)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
