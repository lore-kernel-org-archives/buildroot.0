From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 22:52:32 +0200
Subject: [Buildroot] [PATCH] libbsd: needs wide character support
In-Reply-To: <735ad91388ab3b29dbb08f565c4fe66033d12e6c.1522786815.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Apr 2018 23:20:15 +0300")
References: <735ad91388ab3b29dbb08f565c4fe66033d12e6c.1522786815.git.baruch@tkos.co.il>
Message-ID: <87po3gnhbj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit d879be30495 (package/libbsd: enable for non-glibc toolchains)
 > enabled build of libbsd with uClibc. libbsd requires wchar support.
 > Disable libbsd when uClibc does not provide wchar support.

 > Fixes:
 > http://autobuild.buildroot.net/results/4fb/4fb576c644a7322730658ed585bcc4a353a42e85/
 > http://autobuild.buildroot.net/results/459/45946f11524c57ffa59bf88d4a2ea0d4933fa851/
 > http://autobuild.buildroot.net/results/ee3/ee3ad5172d6a218dfde4cf3e9fecf1906b0fc642/

 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: J?rg Krause <joerg.krause@embedded.rocks>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
