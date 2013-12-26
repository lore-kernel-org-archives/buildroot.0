From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:46:47 +0100
Subject: [Buildroot] [PATCH] ulogd: disable DB backends if no threads
In-Reply-To: <1388057682-2912-1-git-send-email-gustavo@zacarias.com.ar>
References: <1388057682-2912-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131226184647.5db32332@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 26 Dec 2013 08:34:42 -0300, Gustavo Zacarias wrote:
> Database backends need threads even if sqlite does not.
> The mysql client libs need them too but include them in the exclusion
> closure anyway to state it very clearly. Fixes:
> http://autobuild.buildroot.net/results/1ce/1cece0db309dfe5cecc69e88b02428615ed87316/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ulogd/ulogd.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
