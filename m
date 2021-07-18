From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:40:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuci: add license files
In-Reply-To: <20210718080418.1536430-1-fontaine.fabrice@gmail.com>
References: <20210718080418.1536430-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718234002.7974985c@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 18 Jul 2021 10:04:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuci/libuci.hash | 2 ++
>  package/libuci/libuci.mk   | 1 +
>  2 files changed, 3 insertions(+)

It's never great that we have to use source files as license files, as
they often change for other reasons than licensing. I've applied, but
perhaps it would be a good idea to suggest to upstream to add license
files ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
