From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:12:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: update rpath patch to
 upstream version
In-Reply-To: <20200731074821.4137503-1-james.hilliard1@gmail.com>
References: <20200731074821.4137503-1-james.hilliard1@gmail.com>
Message-ID: <20200805231215.3e33461b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 01:48:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The version of this patch merged by upstream has some changes to rpath
> syntax matching and handling for additional syntax edge cases.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...003-backends-fix-rpath-match-pattern.patch | 77 +++++++++++++++----
>  1 file changed, 63 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
