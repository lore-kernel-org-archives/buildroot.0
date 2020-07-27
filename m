From: Alexander Dahl <post@lespocky.de>
Date: Mon, 27 Jul 2020 08:42:35 +0200
Subject: [Buildroot] [PATCH] package/fastd: bump to v19
In-Reply-To: <871rlcxyr1.fsf@dell.be.48ers.dk>
References: <20200611192504.4058-1-post@lespocky.de>
 <871rlcxyr1.fsf@dell.be.48ers.dk>
Message-ID: <20200727064234.xgzcmnvpfpcuxhoo@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

just returning from two weeks holiday ?

On Wed, Jul 15, 2020 at 11:19:14PM +0200, Peter Korsgaard wrote:
> >>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:
> 
>  > Maintenance release, most important is OpenSSL 1.1+ support. See full
>  > release notes for details:
> 
>  > https://fastd.readthedocs.io/en/stable/releases/v19.html
> 
> Does this mean that fastd 18 is broken with openssl 1.1?, E.G. does this
> need to be backported to 2020.02.x?

From the top of my head, I would say no.  It probably means fastd is
supposed to work with OpenSSL 1.1 or later now?  It would have caused
build errors against OpenSSL 1.1 in the past, if that would not have
been the case, right?

I put upstream in Cc, maybe he can answer this?

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200727/94fa8c20/attachment.asc>
