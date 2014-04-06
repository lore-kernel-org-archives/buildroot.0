From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 11:55:50 +0200
Subject: [Buildroot] [PATCH] python: fix host-python symlink
 installation when no python is selected
In-Reply-To: <1396769715-28635-1-git-send-email-s.martin49@gmail.com>
References: <1396769715-28635-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140406115550.6bec56aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  6 Apr 2014 09:35:15 +0200, Samuel Martin wrote:
> When no python interpreter is selected, all host-python symlink
> installation were disabled.
> This could lead to a non-existing $(HOST_DIR)/usr/bin/python program.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/6e7/6e74a343b4e8e113fd34d45c9279419e233afe8a/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/python/python.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
