From: Alexander Dahl <post@lespocky.de>
Date: Mon, 5 Mar 2018 08:58:52 +0100
Subject: [Buildroot] [PATCH] mosquitto: unbreak build with websockets
 and !libopenssl
In-Reply-To: <87vaedb0bz.fsf@dell.be.48ers.dk>
References: <20180303101545.11446-1-peter@korsgaard.com>
 <87vaedb0bz.fsf@dell.be.48ers.dk>
Message-ID: <20180305075851.qi7x46yj7swdge6b@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sat, Mar 03, 2018 at 05:17:20PM +0100, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/d69/d693f3e3f1c73ccf54ac7076623e436355a9d901/b
> 
>  > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> Committed, thanks.

Do you thank yourself here? Doesn't that somehow circumvent a probably
desired review?

Curious.
Alex

-- 
?With the first link, the chain is forged. The first speech censured, 
the first thought forbidden, the first freedom denied, chains us all 
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180305/e5e3ae5a/attachment.asc>
