From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:29:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: add CVE-2020-15389
 entry
In-Reply-To: <20200827212044.218860-1-fontaine.fabrice@gmail.com>
References: <20200827212044.218860-1-fontaine.fabrice@gmail.com>
Message-ID: <20200827232922.42bf10d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Aug 2020 23:20:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit b006cc373f96ec86c027779e113c8f70bc40d1c3 forgot to add
> the OPENJPEG_IGNORE_CVES entry
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openjpeg/openjpeg.mk | 3 +++
>  1 file changed, 3 insertions(+)

Gah, I should have spotted that when applying :-/

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
