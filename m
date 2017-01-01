From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2017 09:24:27 +0100
Subject: [Buildroot] [PATCH] udoo: mx6qdl: Use the preferred form for
 disabling a symbol
In-Reply-To: <1483210839-23311-1-git-send-email-festevam@gmail.com>
References: <1483210839-23311-1-git-send-email-festevam@gmail.com>
Message-ID: <20170101092427.2f0f25b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 31 Dec 2016 17:00:39 -0200, Fabio Estevam wrote:
> Even though 'CONFIG_USB=n' does the job, let's switch to the more
> standard way for disabling a Kconfig symbol.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/udoo/mx6qdl/linux.fragment | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
