From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:43:06 +0200
Subject: [Buildroot] [PATCH v2] Config.in: wrap to column width 72
In-Reply-To: <1464713842-28511-1-git-send-email-martin@surround.io>
References: <1464713842-28511-1-git-send-email-martin@surround.io>
Message-ID: <20160531214306.1b9ec965@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 09:57:22 -0700, Martin Kelly wrote:
> Many lines are not correctly wrapped to 72 column width, so rewrap them.
> In addition, standardize all instances of ".  " to ". ".
> 
> Signed-off-by: Martin Kelly <martin@surround.io>
> ---
> v2:
> - Rename ".  " --> ". "
> ---
>  Config.in | 307 +++++++++++++++++++++++++++++++-------------------------------
>  1 file changed, 156 insertions(+), 151 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
