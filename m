From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 15:51:13 +0200
Subject: [Buildroot] [RFC PATCH v5 10/11] support/scripts:
 check-host-rpath now handles $ORIGIN as well
In-Reply-To: <1498811828-6893-11-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-11-git-send-email-wg@grandegger.com>
Message-ID: <20170702155113.1570e5f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 10:37:07 +0200, Wolfgang Grandegger wrote:
> "$ORIGIN/../../usr/lib" is also a valid RPATH for binaries in
> "$hostdir/usr/bin". After RPATH sanitation, all RPATH
> directories start with "$ORIGIN".
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  support/scripts/check-host-rpath | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
