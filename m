From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:15:42 +0200
Subject: [Buildroot] [PATCH] go: disable for MIPS R6
In-Reply-To: <1467017477-3446-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467017477-3446-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160701001542.263ffa85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Jun 2016 09:51:17 +0100, Vicente Olivert Riera wrote:
> MIPS R6 support in Go has not yet been developed.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/go/Config.in.host | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
