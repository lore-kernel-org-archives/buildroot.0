From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 16:53:07 +0200
Subject: [Buildroot] BASE_TARGETS aren't build
In-Reply-To: <20070725200039.GA26294@firebird.dresden.micronet24.de>
References: <20070725200039.GA26294@firebird.dresden.micronet24.de>
Message-ID: <20070727145307.GA25147@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 25, 2007 at 10:00:39PM +0200, Benjamin Tietz wrote:
>Hi,
>
>some days ago the building of the toolchain and the crosscompiler was
>moved from TARGETS to BASE_TARGETS, and the second made dependent of the
>first. It looked nice, but at least for me, it doesn't work.

Somehow i was lucky and me selecting a native target compiler made
sure that all directories were setup properly.

This dependency glitch should be fixed in r19280.

Please let me know if this works now -- and sorry for any inconvenience
this may have caused..)

cheers,
