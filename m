From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:17:08 +0100
Subject: [Buildroot] [PATCH v3 1/2] linux-headers: bump 3.2.x and 4.{4,
 8}.x series
In-Reply-To: <20161121104928.44869-1-Vincent.Riera@imgtec.com>
References: <20161121104928.44869-1-Vincent.Riera@imgtec.com>
Message-ID: <20161121211708.10c0d633@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Nov 2016 10:49:27 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v2 -> v3:
>  - also bump 3.2.x series
>  - bump 4.8.x series to 4.8.10 instead of 4.8.8
> Changes v1 -> v2:
>  - rebase on top of master
>  - drop 3.12.x changes as they are already part of master
> ---
>  package/linux-headers/Config.in.host | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
