From: Alexander Dahl <post@lespocky.de>
Date: Thu, 3 Jun 2021 15:53:20 +0200
Subject: [Buildroot] Is there a better version of vi?
In-Reply-To: <f7452a41879246d3a3bdbe185657ccdc@AcuMS.aculab.com>
References: <f7452a41879246d3a3bdbe185657ccdc@AcuMS.aculab.com>
Message-ID: <20210603135319.rfppvgyaezkvnkf5@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Thu, Jun 03, 2021 at 01:27:56PM +0000, David Laight wrote:
> The version of vi is busybox is somewhat cutdown.
> I can't see an option to include either nvi or vim.
> 
> While vim has grown all sorts of horrid extensions
> it would be nice to have a version that matches the
> code from the late 1980s.

Someone improved the Vi included in busybox lately, lots of changes
have gone to busybox master branch in the last months.  Maybe you
could give that a try?

> Most annoying is not having :g//p

Not sure if that is covered.

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210603/b91eedb2/attachment.asc>
