From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:20:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: Fix GNU Mirror Path
In-Reply-To: <1486399732-14739-1-git-send-email-redbeard@coreos.com>
References: <1486399732-14739-1-git-send-email-redbeard@coreos.com>
Message-ID: <20170206192039.2b7a2c51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 08:48:52 -0800, Brian 'redbeard' Harrington wrote:
> Replacing ftpmirror.gnu.org with BR2_GNU_MIRROR variable
> 
> Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
> ---
>  package/libtasn1/libtasn1.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
