From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 22:43:57 +0100
Subject: [Buildroot] [PATCH 1/2] package/dropbear: Respect user specific
 configurations
In-Reply-To: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
Message-ID: <20151102224357.213f796c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Cyril Bur,

On Thu, 29 Oct 2015 17:11:41 +1100, Cyril Bur wrote:
> systemd .service file should respect /etc/default/dropbear
> ---
>  package/dropbear/dropbear.service | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
