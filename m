From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:12:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/jbig2dec: bump to version 0.19.0
In-Reply-To: <20200915174347.399685-1-fontaine.fabrice@gmail.com>
References: <20200915174347.399685-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919211225.2eb9268c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 19:43:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump is needed to fix build with ghostscript 9.53.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fbcc2fa29f3736f78212cb4b3869ffaeefda7a33
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jbig2dec/jbig2dec.hash | 4 ++--
>  package/jbig2dec/jbig2dec.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
