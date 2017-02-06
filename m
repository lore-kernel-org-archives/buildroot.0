From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:21:51 +0100
Subject: [Buildroot] Odd comment in openntpd/Config.in
In-Reply-To: <o7aan0$qvb$1@blaine.gmane.org>
References: <o7aan0$qvb$1@blaine.gmane.org>
Message-ID: <20170206192151.0b748b95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Feb 2017 17:10:56 +0000 (UTC), Grant Edwards wrote:

> Is the "!" in the comment is a typo?

However, there is one thing that is wrong in this Config.in file: the
main option has depends on !BR2_PACKAGE_NTP, but not the comment, while
it should have. I'll fix that up.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
