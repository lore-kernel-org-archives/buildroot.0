From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:39:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/c-icap: bump version to 0.5.6
In-Reply-To: <20200428013656.8449-1-ryanbarnett3@gmail.com>
References: <20200428013656.8449-1-ryanbarnett3@gmail.com>
Message-ID: <20200428073954.1981ee6f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 20:36:55 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

>  * Update hash file to two space format and add hashes from sourceforge
>    website.
>  * Drop 0001-Required-fixes-to-compile*.patch as it is included with
>    new release
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  ...ixes-to-compile-and-run-under-cygwin.patch | 391 ------------------
>  package/c-icap/c-icap.hash                    |   7 +-
>  package/c-icap/c-icap.mk                      |   2 +-
>  3 files changed, 6 insertions(+), 394 deletions(-)
>  delete mode 100644 package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
