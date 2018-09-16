From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:44:19 +0200
Subject: [Buildroot] [PATCH 1/1] ipsec-tools: needs host-bison
In-Reply-To: <20180915095906.11558-1-fontaine.fabrice@gmail.com>
References: <20180915095906.11558-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916154419.6612a852@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Sep 2018 11:59:06 +0200, Fabrice Fontaine wrote:
> Making all in racoon
> /bin/sh ../../ylwrap cfparse.y y.tab.c cfparse.c y.tab.h `echo cfparse.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output cfparse.output -- yacc -d
> ../../ylwrap: line 176: yacc: command not found
> make[5]: *** [cfparse.c] Error 127
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/88c8bba943300df98b428646387c240f4522f40a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ipsec-tools/ipsec-tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
