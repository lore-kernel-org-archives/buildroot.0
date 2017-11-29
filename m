From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:42:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump to version
 4.89.1
In-Reply-To: <20171129203827.10872-1-bernd.kuhls@t-online.de>
References: <20171129203827.10872-1-bernd.kuhls@t-online.de>
Message-ID: <20171129214217.2e775f46@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 21:38:27 +0100, Bernd Kuhls wrote:
> Fixes CVE-2017-16943 & CVE-2017-16944:
> https://lists.exim.org/lurker/message/20171128.215505.79ea8efa.en.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exim/exim.hash | 2 +-
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
