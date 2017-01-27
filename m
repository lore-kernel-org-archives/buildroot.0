From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:21:20 +1300
Subject: [Buildroot] [PATCH v5 08/10] python-pyqt5: Depend directly on
 Qt5 rather than its toolchain requirements
In-Reply-To: <1485439461-4797-9-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
 <1485439461-4797-9-git-send-email-anaumann@ultratronik.de>
Message-ID: <20170127212120.04eaddfe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 15:04:19 +0100, Andreas Naumann wrote:
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/python-pyqt5/Config.in | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

What was the motivation for this change? The commit log is empty :-/

Note that I don't disagree with the change, but a little bit more
details about the rationale would be good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
