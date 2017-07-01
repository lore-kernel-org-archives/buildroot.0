From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 15:22:52 +0200
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: add check-DEVELOPERS test
In-Reply-To: <20170630164253.19859-1-arnout@mind.be>
References: <20170630164253.19859-1-arnout@mind.be>
Message-ID: <20170701152252.6d2304a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 18:42:53 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This verifies that the DEVELOPERS file doesn't contain errors. It
> just runs parse_developers from getdeveloperlib and errors out if
> that produces any output.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .gitlab-ci.yml    | 6 ++++++
>  .gitlab-ci.yml.in | 6 ++++++
>  2 files changed, 12 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
