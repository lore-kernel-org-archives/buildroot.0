From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:10:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/json-c: security bump to
 version 0.15
In-Reply-To: <20200827172644.140369-1-fontaine.fabrice@gmail.com>
References: <20200827172644.140369-1-fontaine.fabrice@gmail.com>
Message-ID: <20200827231029.1752021b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Aug 2020 19:26:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-12762: json-c through 0.14 has an integer overflow and
> out-of-bounds write via a large JSON file, as demonstrated by
> printbuf_memappend.
> 
> Also update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/json-c/json-c.hash | 4 ++--
>  package/json-c/json-c.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
