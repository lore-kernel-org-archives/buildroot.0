From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 13:01:05 +0100
Subject: [Buildroot] [PATCH next 1/2] linux-headers: bump 3.12.x,
 4.4.x and 4.8.x series
In-Reply-To: <20161115100123.32010-1-Vincent.Riera@imgtec.com>
References: <20161115100123.32010-1-Vincent.Riera@imgtec.com>
Message-ID: <20161115130105.35750d0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 10:01:22 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/linux-headers/Config.in.host | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Please base those patches on the "master" branch, not next. Kernel
updates typically contain security fixes, and we want them in the master
branch.

(Right now your patches don't apply on the master branch.)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
