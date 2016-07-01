From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 11:11:37 +0200
Subject: [Buildroot] [PATCH v6 6/6] setools: fix build with latest
 selinux libraries.
In-Reply-To: <1466980753-667-7-git-send-email-Aduskett@gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-7-git-send-email-Aduskett@gmail.com>
Message-ID: <20160701111137.3167b1fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 18:39:13 -0400, Adam Duskett wrote:
> Setools 3.3.8 won't cleanly compile against newer versions
> of the new selinux libraries. This patch fixes these errors.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v5 - v6:
>  - Updated patch name to match the one found on git.
>  - Added the original commit message and SoB in the patch.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
