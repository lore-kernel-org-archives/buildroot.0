From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:20:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/cpio: Fix GNU Mirror Path
In-Reply-To: <1486399765-14815-1-git-send-email-redbeard@coreos.com>
References: <1486399765-14815-1-git-send-email-redbeard@coreos.com>
Message-ID: <20170206192044.707e3acc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 08:49:25 -0800, Brian 'redbeard' Harrington wrote:
> Replacing ftpmirror.gnu.org with BR2_GNU_MIRROR variable
> 
> Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
> ---
>  package/cpio/cpio.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
