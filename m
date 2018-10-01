From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Oct 2018 08:43:30 +0200
Subject: [Buildroot] [PATCH] xlib_libXdmcp: add missing dependency on
 host-pkgconf
In-Reply-To: <qdb68fxonm.ln2@ID-313208.user.individual.net>
References: <20180921121350.22638-1-thomas.petazzoni@bootlin.com>
 <qdb68fxonm.ln2@ID-313208.user.individual.net>
Message-ID: <20181001084330.6c027dc1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Sep 2018 09:43:22 +0200, Bernd Kuhls wrote:

> is the current patch series for per-package target/host folders publicly 
> available?

No, I am in the process of cleaning it up and I'll post it when it's
ready. I started a private autobuilder instance that tests the
per-package target/host folders, and that's how I found all these
issues (and I have more coming).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
