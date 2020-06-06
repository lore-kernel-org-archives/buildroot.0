From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:27:51 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/libnetconf2: add patch to
 fix incompatiblity with libssh
In-Reply-To: <20200606071601.6410-1-heiko.thiery@gmail.com>
References: <20200606071601.6410-1-heiko.thiery@gmail.com>
Message-ID: <20200606212751.7fbeead7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 09:16:02 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The libnetconf2 upstream project rejects building with ssh support for
> libssh 0.9.3 and 0.9.4 due to an existing regression.
> 
> This libssh regression bug is already fixed upstream. The libssh buildroot
> package has the patch (39099153d9404cd6f107f0fd92ce8686bbd1beb2).
> 
> Thus we can remove the libnetconf2 cmake check.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f72fcccafe70ecb6b2ba21e8d19c5827a09ffec7/
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...move-version-check-for-faulty-libssh.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/libnetconf2/0001-CMakeList.txt-remove-version-check-for-faulty-libssh.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
