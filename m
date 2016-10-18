From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 14:52:04 +0200
Subject: [Buildroot] [PATCH 3/3] wireshark: needs the qt5tools lrelease
 utility
In-Reply-To: <1b772d44273db8f887bbb378e5dd59053a328c3d.1476789992.git.baruch@tkos.co.il>
References: <a6f0bcffe24a338538c4da2f04091967593fa058.1476789992.git.baruch@tkos.co.il>
 <1b772d44273db8f887bbb378e5dd59053a328c3d.1476789992.git.baruch@tkos.co.il>
Message-ID: <20161018145204.085446ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 14:26:32 +0300, Baruch Siach wrote:

>  # Qt4 needs accessibility, we don't support it

Unrelated to your patch, but this comment is now wrong: my colleague
Romain Perier has added support for Qt4 accessibility.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
