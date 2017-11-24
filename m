From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:35:13 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: bump to version 0.4.2
In-Reply-To: <20171124181017.22108-1-fontaine.fabrice@gmail.com>
References: <20171124181017.22108-1-fontaine.fabrice@gmail.com>
Message-ID: <20171124213513.5ef954d4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Nov 2017 19:10:17 +0100, Fabrice Fontaine wrote:
> - Remove patch (already in version)
> - Add LICENSE hash
> - Change github repo name from 01org to intel
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-static-compilation-of-json2cbor.patch | 28 ----------------------
>  package/tinycbor/tinycbor.hash                     |  3 ++-
>  package/tinycbor/tinycbor.mk                       |  4 ++--
>  3 files changed, 4 insertions(+), 31 deletions(-)
>  delete mode 100644 package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
