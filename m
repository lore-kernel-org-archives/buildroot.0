From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 17:59:35 +0200
Subject: [Buildroot] [PATCH 2/7] toolchain-wrapper: remove remaining
 references to HOST_DIR/usr
In-Reply-To: <20170709232123.30120-3-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-3-arnout@mind.be>
Message-ID: <20170710175935.5c1a3b2e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 01:21:18 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Commit 14151d77af20ec50eeba6e30465debf87b35faaa that eliminated
> $(HOST_DIR)/usr seriously missed the toolchain-wrapper - only a single
> reference was updated, the other three were missed. Commit
> 015d68c84c9c6ad6f6d41f181d19d813f309088b removed one more. This commit
> finally removes the two remaining ones.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  toolchain/toolchain-wrapper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
