From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jan 2017 10:11:30 +0100
Subject: [Buildroot] [PATCH v5 08/10] python-pyqt5: Depend directly on
 Qt5 rather than its toolchain requirements
In-Reply-To: <9311d4db-5c83-2dfe-48d7-9cd9ded1af28@andin.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
 <1485439461-4797-9-git-send-email-anaumann@ultratronik.de>
 <20170127212120.04eaddfe@free-electrons.com>
 <9311d4db-5c83-2dfe-48d7-9cd9ded1af28@andin.de>
Message-ID: <20170130101130.3ed6e634@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Jan 2017 15:20:31 +0100, Andreas Naumann wrote:

> That would be your comment in v3 of this set:
> 
> "When you want python-qt5 it's really obvious that you need
> Qt5, so for the user it's logical to enable Qt5 and then Python-Qt5."

Sure. What I meant is that such explanation should be part of the
commit log. This way, if a few months/years from now we wonder why this
change was done, we have the explanation in the commit log.

> Unfortunately, I wont have time to rework this and your other two 
> comments in the next 10 days. If you need to apply the set earlier than 
> that, feel free to just change as needed.

Sure, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
