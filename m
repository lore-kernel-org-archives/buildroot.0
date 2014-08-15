From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:28:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/localedef: don't use
 config.site when cross-compiling
In-Reply-To: <1407963923-27432-1-git-send-email-romain.naour@openwide.fr>
References: <1407963923-27432-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140815222816.0bb9e6d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 13 Aug 2014 23:05:23 +0200, Romain Naour wrote:
> On fedora 20 64bits host, the file /usr/share/config.site contains
> a fix for installing libraries into /lib/lib64 on 64bits systems
> that redefine libdir in the generated Makefile.
> 
> This causes the bug 7262 reported Normen Bolling.
> 
> Set CONFIG_SITE to "no" to not use config.site
> 
> fixes: https://bugs.busybox.net/show_bug.cgi?id=7262
> 
> Reported-by: Normen Bolling <normen.bolling@teufel.de>
> Cc: Normen Bolling <normen.bolling@teufel.de>
> Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/localedef/localedef.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
