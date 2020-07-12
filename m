From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 21:36:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: add patch for
 fixing build failure with gcc 10
In-Reply-To: <20200712145825.9316-1-heiko.thiery@gmail.com>
References: <20200712145825.9316-1-heiko.thiery@gmail.com>
Message-ID: <20200712213656.4732f44e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jul 2020 16:58:25 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> A fix is available upstream but does not apply on the used version by
> buildroot.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  .../0001-fix-build-issue-with-gcc-10.patch    | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
