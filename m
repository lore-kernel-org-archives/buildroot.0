From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:27:31 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/ltp-testsuite: fix static build with lts-musl
In-Reply-To: <20191115215636.13947-1-fontaine.fabrice@gmail.com>
References: <20191115215636.13947-1-fontaine.fabrice@gmail.com>
Message-ID: <20191115232731.5cda318a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 22:56:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/a43def025d44344a4a690b52a52b3959e20b5d26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Don't add a new FTS_LIBS variable but prepend libraries to LDLIBS
>    instead of appending them

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
