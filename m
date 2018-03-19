From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 09:27:14 +0100
Subject: [Buildroot] [PATCH] glibc: install the obsolete libnsl
In-Reply-To: <d9f3b3cf8413fcabd4468a6057ee399a3968d20d.1520956780.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 13 Mar 2018 17:59:40 +0200")
References: <d9f3b3cf8413fcabd4468a6057ee399a3968d20d.1520956780.git.baruch@tkos.co.il>
Message-ID: <87in9scvx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > glibc 2.27 stopped installing libnsl by default. Restore libnsl install
 > to fix packages, like exim, that use that library.

 > Fixes (exim):
 > http://autobuild.buildroot.net/results/a19/a19df43be7d27cf8815e1257122d25aa8285d75b/
 > http://autobuild.buildroot.net/results/8ec/8ecfc42a81efec8485784f945e231eb40a087b5b/
 > http://autobuild.buildroot.net/results/054/054eb702a9b8c66454970333ef45a0afccb7cc80/

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
