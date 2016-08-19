From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:04:44 +0200
Subject: [Buildroot] [PATCH v2 next 2/2] logrotate: bump version to
 3.10.0
In-Reply-To: <1471626904-29215-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471626904-29215-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1471626904-29215-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160819230444.5fc60704@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 22:45:04 +0530, Rahul Bedarkar wrote:
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
> Changes v1 -> v2:
>   - Rebase on top of next branch. (Suggested by Thomas Petazzoni)
> ---
>  package/logrotate/logrotate.hash | 2 +-
>  package/logrotate/logrotate.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I've applied to next, after adding the second patch needed to fix the
gcc 6.x build.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
