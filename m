From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2020 23:46:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptables: fix static build
In-Reply-To: <20200909194619.1308235-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 9 Sep 2020 21:46:19 +0200")
References: <20200909194619.1308235-1-fontaine.fabrice@gmail.com>
Message-ID: <874ko55mq1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Static build of iptables 1.8.5 fails on:
 > /srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > ../libxtables/.libs/libxtables.a(libxtables_la-xtables.o): in function
 > `dlreg_free':
 > /srv/storage/autobuild/run/instance-3/output-1/build/iptables-1.8.5/libxtables/xtables.c:235:
 > undefined reference to `dlclose'

 > Issue has been added with
 > https://git.netfilter.org/iptables/commit/?id=7db4333dc0b6cd8e943fab78d6dab40ff9f4512e

 > Fixes:
 >  - http://autobuild.buildroot.org/results/00f551be87507757a78e332f2859b1e7b3190363

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
