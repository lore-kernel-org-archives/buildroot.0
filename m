From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:00:44 +0200
Subject: [Buildroot] [PATCH 4/5] grub2: really disable liblzma
In-Reply-To: <1465917079-30473-4-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465917079-30473-4-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160615230044.2017d301@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Jun 2016 17:11:18 +0200, Gilles Chanteperdrix wrote:
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  boot/grub2/grub2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied to master, after extending a bit the commit log, as
suggested by Yann E. Morin.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
