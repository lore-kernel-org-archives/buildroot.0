From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 21:58:09 +0200
Subject: [Buildroot] [PATCH 03/16 v3] doc/asciidoc: add possibility to
 define document dependencies
In-Reply-To: <8b101d01b6a1c1aaadde0649c82fba5db2c511f1.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <8b101d01b6a1c1aaadde0649c82fba5db2c511f1.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827215809.1c4e4262@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:23 +0200, Yann E. MORIN wrote:
> Currently, a document can not have dependencies, except for the purely
> internal ones (like checking asciidoc version, and presence of dblatex).
> 
> For our own manual, this will come in handy when we introduce a
> generated kconfig snippet, so we can actually make the manual depend on
> that snippet being generated first.
> 
> For external documents, it can be used to depend on host-packages if
> need be (e.g. a custom host packages that generates specific media files
> included in the manual).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  docs/manual/adding-packages-asciidoc.txt | 3 +++
>  package/doc-asciidoc.mk                  | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
