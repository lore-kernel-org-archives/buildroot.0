From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 11 Feb 2016 23:22:37 +0100
Subject: [Buildroot] [PATCH 05/16 v4] core/pkg-generic: reorder
 variables definitions for legal-info
In-Reply-To: <67f6a5f78fbec35e884eac7200bf0a1f3ad2968d.1454536753.git.yann.morin.1998@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <67f6a5f78fbec35e884eac7200bf0a1f3ad2968d.1454536753.git.yann.morin.1998@free.fr>
Message-ID: <56BD09AD.1070108@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/2016 23:21, Yann E. MORIN wrote:
> Move the declarations of _ACTUAL_SOURCE and _ACTUAL_SITE earlier, so
> that they are close to where _SOURCE and _SITE are handled.
> 
> This looks so far like a purely cosmetic change, but makes more sense
> with the follow-up patch, where we'll need them earlier in the file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

It's identical to v4, so:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
