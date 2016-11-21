From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 23:18:27 +0100
Subject: [Buildroot] [PATCH next] ser2net: bump version to 3.2
In-Reply-To: <20161117163229.3816-1-Vincent.Riera@imgtec.com>
References: <20161117163229.3816-1-Vincent.Riera@imgtec.com>
Message-ID: <20161121231827.6eaeb62a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 16:32:29 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Notes to the maintainer:
>  - ser2net was bumped to 3.1 in master branch (autobuilder fixes) but
>    not in next branch. This patch will cause a conflict when merging
>    next into master after the 2016.11 release.

Noted. Peter, see the above for the record.

> ---
>  package/ser2net/ser2net.hash | 2 +-
>  package/ser2net/ser2net.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
