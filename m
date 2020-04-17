From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:10:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: add patch to fix
 reported version
In-Reply-To: <20200415104639.1229-1-heiko.thiery@gmail.com>
References: <20200415104639.1229-1-heiko.thiery@gmail.com>
Message-ID: <20200417221039.699743d4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 12:46:40 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The released libssh package does wrongly reports the previous version.
> This patch fixes the version field in the lib.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  .../0001-libssh.h-bump-to-version-0.9.4.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
