From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:50:32 +0100
Subject: [Buildroot] [PATCH v7 02/18] core: use $(CURDIR) to set TOPDIR
In-Reply-To: <1457564339-27294-3-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20160310235032.27453fa8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed,  9 Mar 2016 23:58:43 +0100, Samuel Martin wrote:
> This changes saves a shell call and uses a variable automatically set
> by make [1].
> 
> [1] http://www.gnu.org/software/make/manual/make.html#Quick-Reference
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v6->v7:
> - none

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
