From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 10:21:50 +0100
Subject: [Buildroot] [PATCH] w_scan: bump version to 20141122
In-Reply-To: <1417714796-65316-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417714796-65316-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141208102150.73cc6e2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 4 Dec 2014 17:39:56 +0000, Vicente Olivert Riera wrote:
> - Bump version to 20141122
> - Add a hash file
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/w_scan/w_scan.hash |    2 ++
>  package/w_scan/w_scan.mk   |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
>  create mode 100644 package/w_scan/w_scan.hash

Apparently causes some build failures:
http://autobuild.buildroot.org/results/d75/d755df306bf22e78f7d3304191250b3f66a8e634/build-end.log.

Can you have a look?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
