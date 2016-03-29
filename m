From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:02:32 +0200
Subject: [Buildroot] [PATCH] boot/grub2: enable squashfs support by
 default
In-Reply-To: <1459199016-19064-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459199016-19064-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160329030232.6df381d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 18:03:36 -0300, Gustavo Zacarias wrote:
> Size growth is minimal and generally a non-issue for x86-based
> platforms.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  boot/grub2/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
