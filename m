From: Micha Nelissen <micha@neli.hopto.org>
Date: Tue, 07 Oct 2008 23:14:25 +0200
Subject: [Buildroot] proftpd does not compile
In-Reply-To: <20081007205949.GF5178@mx.loc>
References: <gc8fta$bif$1@ger.gmane.org>
	<48E9CB77.8060808@netcentral.co.uk>	<gcdcjp$v98$1@ger.gmane.org>
	<48EA3AEA.7070206@netcentral.co.uk>	<gcghe9$fb1$1@ger.gmane.org>
	<20081007205949.GF5178@mx.loc>
Message-ID: <gcgjfq$m07$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Reutner-Fischer wrote:
> On Tue, Oct 07, 2008 at 10:39:28PM +0200, Micha Nelissen wrote:
>> Could be but this seems to replace all bcopy uses with memcpy? That 
>> seems a workaround to me, not really solving the root problem.
> 
> Using memcpy et al instead of bcopy, bzero, etc. certainly is the proper
> thing to do. Fix your application not to rely on legacy stuff that was
> _obsoleted_ (not deprecated, but really obsoleted) a decade ago.

Yes the patch is perfectly acceptable to me, but I didn't want to offend 
the one who removed that patch ;-). I assume there was some reason to 
remove it.

Micha
