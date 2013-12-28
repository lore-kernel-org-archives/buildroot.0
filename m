From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 16:32:14 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: expose 'graph-depends' to
 generate a graph of the dependency tree
In-Reply-To: <0fad080c135d79abdbe042514e30b393c25f5a77.1388185918.git.yann.morin.1998@free.fr>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
 <0fad080c135d79abdbe042514e30b393c25f5a77.1388185918.git.yann.morin.1998@free.fr>
Message-ID: <20131228163214.53624aab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 00:12:51 +0100, Yann E. MORIN wrote:

>  all: menuconfig
> @@ -857,6 +869,7 @@ endif
>  	@echo '  manual-text            - build manual in text'
>  	@echo '  manual-epub            - build manual in ePub'
>  	@echo '  graph-build            - generate graphs of the build times'
> +	@echo '  graph-depends          - generate graph of the dependency tree'

You could also describe:

	@echo '  <package>-graph-depends'

near the help text for <package>-rebuild and <package>-reconfigure

Or at least mention it somewhere in the manual.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
