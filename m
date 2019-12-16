From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 09:36:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix build with uclibc
In-Reply-To: <20191215173431.516170-1-fontaine.fabrice@gmail.com>
References: <20191215173431.516170-1-fontaine.fabrice@gmail.com>
Message-ID: <20191216093645.341f8e56@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Dec 2019 18:34:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - autobuild.buildroot.org/results/9507739b3d5d51024ee9c60b74c2f85d5004e7e2

URL should start with http://autobuild.buildroot.org and not just
autobuild.buildroot.org, otherwise it's not picked up by our statistics.

No need to resend, can be fixed when applying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
