From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:17:35 +0200
Subject: [Buildroot] [PATCH] busybox: enable fdisk in default config
In-Reply-To: <1406295779-2323-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406295779-2323-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140726091735.6ce5a550@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 25 Jul 2014 10:42:59 -0300, Gustavo Zacarias wrote:
> As noted by mnemoc on IRC the default busybox config doesn't enable
> fdisk and util-linux is hidden by !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.
> On modern systems fdisk usage is becoming more common so enable it, it
> just adds up ~25 KiB to total binary size.
> People who are on the edge for space savings will normally customize
> their busybox config.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/busybox/busybox.config | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
