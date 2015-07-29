From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:20:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/ctorrent: fix compilation under
 musl.
In-Reply-To: <1438192620-3601-1-git-send-email-brendanheading@gmail.com>
References: <1438192620-3601-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150729222018.243ad215@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Wed, 29 Jul 2015 18:57:00 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/2c9/2c9ef771d146ce5b9df82735fdeb62926c84bd9f/
> 
> Build failed due to use of ssize_t without including <unistd.h>.
> 
> Patch submitted upstream (note: project appears dormant).
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  package/ctorrent/0001-fix-musl-build.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/ctorrent/0001-fix-musl-build.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
