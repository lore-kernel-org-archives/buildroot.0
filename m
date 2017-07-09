From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 09 Jul 2017 23:10:56 +0200
Subject: [Buildroot] [PATCH] libssh2: fix link with libgcrypt
In-Reply-To: <2fef5081d7176868ea9bd4b9c00b083ac0de57aa.1499627124.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 9 Jul 2017 22:05:24 +0300")
References: <2fef5081d7176868ea9bd4b9c00b083ac0de57aa.1499627124.git.baruch@tkos.co.il>
Message-ID: <8737a5uxi7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libssh2 uses the implicit 'yes' argument of the --with-libgcrypt parameter as
 > a library path prefix, which breaks the build. Pass the library path as
 > --with-libgcrypt argument to fix that. Drop the unneeded
 > --with-libgcrypt-prefix.

 > Fixes:
 > http://autobuild.buildroot.net/results/ac3/ac3a3f5871a6c20f5407a468809682ce491b9cb3/
 > http://autobuild.buildroot.net/results/ba3/ba31fa11b2ce2875649414dd9093e039dfc129e8/
 > http://autobuild.buildroot.net/results/b07/b07bbbf7fe164ba6dc435de6d8b41fadff7a3b08/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
