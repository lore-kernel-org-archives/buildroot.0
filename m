From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 09:25:55 +0200
Subject: [Buildroot] [PATCH] git: security bump to version 2.12.3
In-Reply-To: <20170515144447.8596-1-peter@korsgaard.com>
References: <20170515144447.8596-1-peter@korsgaard.com>
Message-ID: <20170516092555.17b5acf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 May 2017 16:44:47 +0200, Peter Korsgaard wrote:
> Fixes CVE-2017-8386 - Git Shell Bypass By Abusing Less
> 
> For more details, see:
> https://insinuator.net/2017/05/git-shell-bypass-by-abusing-less-cve-2017-8386/
> http://www.mail-archive.com/git at vger.kernel.org/msg120982.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
