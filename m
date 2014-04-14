From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:14:56 +0200
Subject: [Buildroot] [PATCH 3/5] omniorb: force python interperter
In-Reply-To: <1397509552-5278-4-git-send-email-s.martin49@gmail.com>
References: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
 <1397509552-5278-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20140414231456.46b1c585@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 14 Apr 2014 23:05:50 +0200, Samuel Martin wrote:
> Omniorb build-system requires python2 interpreter.
> 
> By default, it looks for python program, which may fallback on the system
> python interpreter in case python is disabled and python3 is enabled.
> 
> So, this patch enforces the python interpreter to python2 built by
> Buildroot.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/b4f/b4f3a2602ba0224ac3253c4bf6ed87ec045df772/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/omniorb/omniorb.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
