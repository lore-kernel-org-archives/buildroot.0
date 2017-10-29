From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 20:49:40 +0100
Subject: [Buildroot] [PATCH] package/python-pyqt5: fix build with Qt
 5.6.3'
In-Reply-To: <1509264949-15907-1-git-send-email-scott@jumpnowtek.com>
References: <1509264949-15907-1-git-send-email-scott@jumpnowtek.com>
Message-ID: <20171029204940.0eb74d6d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 04:15:49 -0400, Scott Ellis wrote:
> This commit adds 5_6_3 to the Timeline patch that fixed
> builds with Qt 5.6.2.
> 
> Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
> ---
>  package/python-pyqt5/0002-fix-qt-5.6.2.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after further tweaking the commit log, and adjusting
the patch description to mention 5.6.3 being fixed as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
