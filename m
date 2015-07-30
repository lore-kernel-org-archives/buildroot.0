From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:37:00 +0200
Subject: [Buildroot] [PATCH v2] package/dropbear: Fix symlink only if
 pointing to the right directory
In-Reply-To: <1438071691-9078-1-git-send-email-paul@crapouillou.net>
References: <1438071691-9078-1-git-send-email-paul@crapouillou.net>
Message-ID: <20150730233700.14e9f916@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Tue, 28 Jul 2015 10:21:31 +0200, Paul Cercueil wrote:
> This commit ensures that the /etc/dropbear symlink won't be removed if
> it points elsewhere than /var/run/dropbear.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied after fixing the issues pointed by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
