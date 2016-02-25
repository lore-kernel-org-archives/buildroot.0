From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2016 21:16:02 +0100
Subject: [Buildroot] [PATCH v3 2/2] docs/manual: add section about patch
	licensing
In-Reply-To: <1456401075-16948-3-git-send-email-luca@lucaceresoli.net>
References: <1456401075-16948-1-git-send-email-luca@lucaceresoli.net>
 <1456401075-16948-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160225201602.GC5870@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-02-25 12:51 +0100, Luca Ceresoli spake thusly:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Steve Calfee <stevecalfee@gmail.com>
> 
> ---
> 
> Note: although there are only wording improvements since v2, I did not
> carry the Acked-by from Thomas and Arnout because the topic is
> delicate and Yann explicitly nacked the patch.

IIRC, I NAKed it because, in case of proprietary packages, the patches
can only be available under the FLOSS license of the package they are
applied to.

[--SNIP--]
> +==== Patches to packages
> +
> +Buildroot is bundled with a set of patches that are applied to
> +packages to fix cross-compilation or other issues. See
> +xref:patch-policy[] for the technical details.
> +
> +These patches are effectively a derived work of the package they are
> +applied to, and so they are released under the same license as the
> +software they apply to. They are not distributed under the Buildroot
> +license.

Why not repeat the same sentence as the one from the previous patch?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
