From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Mar 2007 15:29:13 +0100
Subject: [Buildroot] [PATCH] Fix missing/broken $(CONFIG_UPDATE) calls
In-Reply-To: <20070222183543.1af6a2ed@dhcp-252-105.norway.atmel.com>
References: <20070222183543.1af6a2ed@dhcp-252-105.norway.atmel.com>
Message-ID: <20070307142913.GB16872@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 22, 2007 at 06:35:43PM +0100, Haavard Skinnemoen wrote:
>This patch fixes a broken use of $(CONFIG_UPDATE) in bash.mk
>(config.sub and config.guess is stored in the "support" subdirectory,
>not directly under $(BASH_DIR)) and adds $(CONFIG_UPDATE) to
>several other makefiles.
>
>There are probably other cases that need to be fixed up as well,
>but these are the ones that broke for me when compiling for AVR32
>(which hasn't propagated out to config.sub in all the individual
>packages yet.)
>
>Hope you don't mind this `git' style patch. If you do, please let me
>know.

git style is fine with me.

Applied, thanks.
