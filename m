From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Thu, 14 Aug 2014 21:19:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/localedef: don't use
	config.site when cross-compiling
In-Reply-To: <1407963923-27432-1-git-send-email-romain.naour@openwide.fr>
References: <1407963923-27432-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAAXf6LWLHuso9dODNxZ4vRrqN0n5hGJoBjsOEOgp27JzBR8hvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 13, 2014 at 11:05 PM, Romain Naour <romain.naour@openwide.fr> wrote:
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

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This patch should go in 2014.08.

Best regards,
Thomas
