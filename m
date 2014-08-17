From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 17 Aug 2014 15:01:42 +0200
Subject: [Buildroot] [PATCH 07/24 v4] manual: document dependencies
	on	atomic operations
In-Reply-To: <4061c3ce3e322eed4f6a91e635133d0e0dd2e2f4.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
 <4061c3ce3e322eed4f6a91e635133d0e0dd2e2f4.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <5dc49087-92a9-4ec1-a145-bcc77ecbad46@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>From: Anton Kolesov <anton.kolesov@synopsys.com>
>
>Add atomic operations to the list of generic dependencies.
>
>Since this is an architecture option, there is no comment string to be
>added.
>
>Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
>[yann.morin.1998 at free.fr: use the new arch-option; remove comment string]
>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>---
> docs/manual/adding-packages-directory.txt | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
>index 93e6a3e..40a81d5 100644
>--- a/docs/manual/adding-packages-directory.txt
>+++ b/docs/manual/adding-packages-directory.txt
>@@ -219,6 +219,10 @@ use in the comment.
> ** Dependency symbol: +BR2_USE_MMU+
> ** Comment string: no comment to be added
> 
>+* Atomic operations
>+** Dependency symbol: +BR2_ARCH_HAS_ATOMICS+
>+** Comment string: no comment to be added
>+

Should we provide a brief explanation, reference, or
 name of these functions to make it a bit clearer what
is meant with 'atomic operations'?
