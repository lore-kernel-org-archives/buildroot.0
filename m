From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:37:24 +0200
Subject: [Buildroot] [PATCH 1/4] tcl: switch to * instead of [0-9]
In-Reply-To: <1459354450-37009-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1459354450-37009-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160330193724.4deb0ec3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 17:14:07 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/tcl/tcl.mk | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)

All four patches applied, thanks! On this first patch, I've added a
real commit log to explain why we're doing this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
