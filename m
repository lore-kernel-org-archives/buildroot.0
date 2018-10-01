From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 23:44:08 +0200
Subject: [Buildroot] [PATCH 1/1] ipsec-tools: needs host-bison
In-Reply-To: <20180915095906.11558-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 Sep 2018 11:59:06 +0200")
References: <20180915095906.11558-1-fontaine.fabrice@gmail.com>
Message-ID: <875zyl1gwn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Making all in racoon
 > /bin/sh ../../ylwrap cfparse.y y.tab.c cfparse.c y.tab.h `echo
 > cfparse.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e
 > s/c++$/h++/ -e s/c$/h/` y.output cfparse.output -- yacc -d
 > ../../ylwrap: line 176: yacc: command not found
 > make[5]: *** [cfparse.c] Error 127

 > Fixes:
 >  - http://autobuild.buildroot.org/results/88c8bba943300df98b428646387c240f4522f40a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
