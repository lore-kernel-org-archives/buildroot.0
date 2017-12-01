From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:00:49 +0100
Subject: [Buildroot] [PATCH 8/8] gitlab-ci: run check-package
In-Reply-To: <b9a9596c19817cf5a70c17acaa23657ed3597f01.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <b9a9596c19817cf5a70c17acaa23657ed3597f01.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171201230049.5cfe8b42@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:45 +0100, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  .gitlab-ci.yml    | 4 ++++
>  .gitlab-ci.yml.in | 4 ++++
>  2 files changed, 8 insertions(+)

Applied to master, after doing two other commits fixing .mk files
warning introduced in the next branch. We're down to just the false
warning from asterisk.mk.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
