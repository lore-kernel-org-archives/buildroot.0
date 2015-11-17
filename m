From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 12:25:23 +0100
Subject: [Buildroot] [PATCH 05/21 RFC] core/pkg-virtual: ignore from
 legal-info output
In-Reply-To: <e3506e59aa801227a1e47ccace2ef664fdaf0eca.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <e3506e59aa801227a1e47ccace2ef664fdaf0eca.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <20151117122523.0d924b33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 16 Nov 2015 23:47:00 +0100, Yann E. MORIN wrote:
> Virtual packages really have nothing to save for legal-info, so we just
> ignore them.
> 

> Following patches will always extract-and-aptch non-ignored packages, so
> we would potentially see spurious "extracting" and "patching" messages
> on the console, which would be a bit strange. Ignoring virtual packages
> will get us a cleaner log.

aptch -> patch. And the extract-and-patch can be just "extract and
patch".

It's also not really clear what you mean by "Following patches will
always extract and patch non-ignored packages". Aren't we already doing
that for legal-info ? (Note: I haven't looked at the following patches
yet, things might get clearer when I'll reach the next patches, but it
seems weird to not understand a commit log if you haven't read the next
patches).

Otherwise, I'm fine with the change, as soon as we reach an agreement
on PATCH 04/21.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
