From: Alexander Dahl <post@lespocky.de>
Date: Mon, 22 Jun 2020 12:51:52 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2020.79
In-Reply-To: <87eeq78o4n.fsf@dell.be.48ers.dk>
References: <20200622073933.236001-1-francois.perrad@gadz.org>
 <87eeq78o4n.fsf@dell.be.48ers.dk>
Message-ID: <20200622105151.rrcjmjdqxiy5pcgp@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Mon, Jun 22, 2020 at 11:07:36AM +0200, Peter Korsgaard wrote:
> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
> 
>  > CBC ciphers, 3DES and hmac-sha1-96 are now disabled by default.
> 
> Do we expect that to cause compatibility issues?

I just looked in package/dropbear/dropbear.mk and those options are
explicitly disabled if DROPBEAR_DISABLE_LEGACY_CRYPTO is set. From a
quick glance I would say now there's no possibility to activate those
anymore.

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200622/a0658326/attachment.asc>
