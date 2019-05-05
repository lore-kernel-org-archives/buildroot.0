From: Alexander Dahl <post@lespocky.de>
Date: Sun, 5 May 2019 17:42:10 +0200
Subject: [Buildroot] Buildroot multi-arch build
In-Reply-To: <BL0PR0102MB341237052A8B224C63E58B9FF3350@BL0PR0102MB3412.prod.exchangelabs.com>
References: <BL0PR0102MB341237052A8B224C63E58B9FF3350@BL0PR0102MB3412.prod.exchangelabs.com>
Message-ID: <20190505154209.c2zjo36l6wgam5ul@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Fri, May 03, 2019 at 08:21:41PM +0000, Gervais, Francois wrote:
> We use the same buildroot environment for x86_64, armhf and arm64.
> 
> For each architecture, everything is the same except for the architecture definition.

What you won't be able to avoid is building everything three times.
Those architectures all need different toolchains. You probably
already know this? ;-)

> Is there a way to achieve this without maintaining 3 config files?

Maybe you can somehow work with some kind of config template you
maintain, and generate those three buildroot configs from it?

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190505/5649abab/attachment.asc>
