From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 16:02:08 +0100
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: propagate LDCONFIG=true
In-Reply-To: <20161118152427.16515-1-maxime.hadjinlian@gmail.com>
References: <20161118152427.16515-1-maxime.hadjinlian@gmail.com>
Message-ID: <20161211160208.14bba856@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 16:24:26 +0100, Maxime Hadjinlian wrote:
> We correctly set LDCONFIG=true for MAKE_OPTS, but not for the other
> steps which don't inherit it, to avoid permissions error displayed
> during the build, we need to set them up.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
