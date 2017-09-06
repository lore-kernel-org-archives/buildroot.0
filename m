From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 21:58:43 +0200
Subject: [Buildroot] [PATCH] file: security bump to version 5.32
In-Reply-To: <20170906140037.3852-1-peter@korsgaard.com>
References: <20170906140037.3852-1-peter@korsgaard.com>
Message-ID: <20170906215843.5536a635@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Sep 2017 16:00:37 +0200, Peter Korsgaard wrote:
> Fixes CVE-2017-1000249 - Stack buffer overflow with a specially crafted
> .notes section in an ELF binary file.
> 
> For more details, see: http://www.openwall.com/lists/oss-security/2017/09/05/3
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/file/file.hash | 2 +-
>  package/file/file.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
