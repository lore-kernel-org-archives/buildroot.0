From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 17:19:42 +0200
Subject: [Buildroot] [PATCH] package/evtest: fix build with musl libc
In-Reply-To: <20190819155608.5e1ca87a@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 19 Aug 2019 15:56:08 +0200")
References: <e2ce15f16bd923a646e479cae502778116258d1a.1566112990.git.baruch@tkos.co.il>
 <20190819154210.73305e0e@windsurf.home>
 <20190819134615.c3xy6eo4s5mrqhq2@sapphire.tkos.co.il>
 <20190819155608.5e1ca87a@windsurf.home>
Message-ID: <87ftle3eup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Baruch,
 > On Mon, 19 Aug 2019 16:46:15 +0300
 > Baruch Siach <baruch@tkos.co.il> wrote:

 >> Hi Thomas,
 >> 
 >> On Mon, Aug 19, 2019 at 03:42:10PM +0200, Thomas Petazzoni wrote:
 >> > On Sun, 18 Aug 2019 10:23:10 +0300
 >> > Baruch Siach <baruch@tkos.co.il> wrote:
 >> >   
 >> > > Add a patch adding missing limits.h header include.
 >> > > 
 >> > > Fixes:
 >> > > http://autobuild.buildroot.net/results/c5f1b95741b37f6d949b3407fff901a960c6b781/
 >> > > http://autobuild.buildroot.net/results/b09a6b340f0a96081a55764b5dad0c2c31240cef/
 >> > > http://autobuild.buildroot.net/results/90c7a092a5492699406d3f46e0039d253146b6b7/
 >> > > 
 >> > > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> > > ---
 >> > >  .../0001-Add-missing-limits.h-include.patch   | 38 +++++++++++++++++++
 >> > >  1 file changed, 38 insertions(+)
 >> > >  create mode 100644 package/evtest/0001-Add-missing-limits.h-include.patch  
 >> > 
 >> > Applied to master, thanks.  
 >> 
 >> This fixes an issue in next after the last evtest version bump. Sorry for not 
 >> mentioning that in subject.

 > Ah indeed, I didn't realize that, and didn't check the autobuilder
 > references. The patch applies fine to master though, and will cause no
 > harm. So I just cherry-picked it in next. I don't think it's worth the
 > effort reverting on master (unless you see a reason to do so ?).

I missed that as well, so I've applied to 2019.02.x and 2019.05.x.

Oh well, shouldn't cause any harm.
-- 
Bye, Peter Korsgaard
