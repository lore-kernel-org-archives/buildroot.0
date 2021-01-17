From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:30:52 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/zstd: build multithreaded
 library if supported
In-Reply-To: <20201204095703.4714-1-patrickdepinguin@gmail.com>
References: <20201204095703.4714-1-patrickdepinguin@gmail.com>
Message-ID: <20210117153052.0d4448ff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Dec 2020 10:57:01 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> libzstd.so is built without multi-threading support by default.
> The 'HAVE_THREAD' flag is not respected by lib/Makefile, only by
> programs/Makefile.
> 
> Use the %-mt recipe in lib/Makefile to enable multithreading.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> v2: split off of next patch

Applied to master, thanks. It would be good to have a patch that
enables the multi-threading for the host variant of zstd.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
