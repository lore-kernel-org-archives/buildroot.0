From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:45:13 +0100
Subject: [Buildroot] [PATCH 1/2] linux: bump default to version 4.14.3
In-Reply-To: <1512162615-23829-1-git-send-email-festevam@gmail.com>
References: <1512162615-23829-1-git-send-email-festevam@gmail.com>
Message-ID: <20171201224513.720ff749@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 19:10:14 -0200, Fabio Estevam wrote:
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, I've applied both. I changed the second patch to only bump the
4.14.x headers, because 4.4.x and 4.9.x was already done by a patch
that Bernd submitted earlier.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
