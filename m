From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 19 Sep 2014 22:18:29 +0200
Subject: [Buildroot] [PATCH 07/23 v5] docs/manual: simplify generation
	dependencies
In-Reply-To: <7dc3e2f0cf37f042723a473e1de04e5e432f7c75.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <7dc3e2f0cf37f042723a473e1de04e5e432f7c75.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LU8zTz-YNgBZfpNUwHkjWLPawgxAM655kvxkEX9_Vq5FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> The document's main file is already part of MANUAL_SOURCES, so no need
> to explicitly depend on it.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Just a side note: I've been wondering if we should change the
extension of the manual source files from .txt to .asciidoc. This
seems to be the default extension and will make sure that vim selects
the right syntax highlighting by default. I guess other editors would
do the same (not tested).
What do you think of that? Or is it unnecessary?
On Debian, vim does not parse the modeline by default for security
reasons, so the first two lines in each of these .txt files do not
help there.

Best regards,
Thomas
