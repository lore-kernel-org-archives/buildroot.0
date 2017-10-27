From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Oct 2017 14:45:00 +0200
Subject: [Buildroot] python-pyqt5 fails when using qt 5.6.3
In-Reply-To: <1509107663.90771784@apps.rackspace.com>
References: <1509107663.90771784@apps.rackspace.com>
Message-ID: <20171027144500.318a417a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Oct 2017 08:34:23 -0400 (EDT), Scott Ellis wrote:
> Adding Qt_5_6_3 to the existing fix-qt-5.6.2 patch fixes it.

Thanks for this contribution!

However, it would need to be formatted using Git. I.e, could you commit
this file in your local Git repository with an appropriate commit log
(including a description and a Signed-off-by line), then turn it into a
patch using "git format-patch" and then send it using "git send-email" ?

This way, we could easily apply it. Do not hesitate to ask for more
details if needed.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
