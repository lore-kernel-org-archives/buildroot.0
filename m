From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:16:48 +0100
Subject: [Buildroot] [PATCH next] ncftp: bump version to 3.2.6
In-Reply-To: <20161130172152.35197-1-Vincent.Riera@imgtec.com>
References: <20161130172152.35197-1-Vincent.Riera@imgtec.com>
Message-ID: <20161130221648.0de5e933@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 17:21:52 +0000, Vicente Olivert Riera wrote:
> Upstream provides xz tarballs instead of bz2, so make the switch.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ncftp/ncftp.hash | 2 +-
>  package/ncftp/ncftp.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
