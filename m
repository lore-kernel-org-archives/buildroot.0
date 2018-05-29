From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:43:02 +0200
Subject: [Buildroot] [PATCH next] conntrack-tools: bump to version 1.4.5
In-Reply-To: <d571a079e5d9edc537a6906d1745406bbd36b744.1527618720.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 May 2018 21:32:00 +0300")
References: <d571a079e5d9edc537a6906d1745406bbd36b744.1527618720.git.baruch@tkos.co.il>
Message-ID: <87vab645a1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop the musl workaround. musl can handle the suppression of conflicting
 > kernel headers definitions.

 > Add license file hash.

 > This bump fixes compatibility with older versions of
 > libnetfilter_conntrack.

 > Fixes:
 > http://autobuild.buildroot.net/results/0ae/0aee137c9977e0fb33e7e557b75481780b90edcc/
 > http://autobuild.buildroot.net/results/9c1/9c178ec5ad84224a385c3184f09ea9b65867a302/
 > http://autobuild.buildroot.net/results/5e1/5e1ea89e01a9cc13bd384c97903e1726df6d2228/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next after fixing s/older/newer/, thanks.

-- 
Bye, Peter Korsgaard
