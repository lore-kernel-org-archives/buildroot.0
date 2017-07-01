From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:34:53 +0200
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: fix it again
In-Reply-To: <20170701182227.11778-1-arnout@mind.be>
References: <20170701182227.11778-1-arnout@mind.be>
Message-ID: <20170702003453.6c82c923@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Jul 2017 20:22:27 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> It seems the ! is removed by the yaml parser, so it needs to be quoted.
> While we're at it, add some explanatory comment.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .gitlab-ci.yml    | 5 ++++-
>  .gitlab-ci.yml.in | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
