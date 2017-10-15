From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 16:00:32 +0200
Subject: [Buildroot] [PATCH] bzip2: fix passing of TARGET_MAKE_ENV to
 make
In-Reply-To: <1507891404-1225-1-git-send-email-luca@lucaceresoli.net>
References: <1507891404-1225-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20171015160032.0c5d4a48@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Oct 2017 12:43:24 +0200, Luca Ceresoli wrote:
> TARGET_MAKE_ENV is not passed to make because it is on a different
> line without a backslash.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/bzip2/bzip2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
