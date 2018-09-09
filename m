From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:13:44 +0200
Subject: [Buildroot] [PATCH] shairport-sync: add upstream patch to fix
 soxr configure issue
In-Reply-To: <20180909094317.10873-1-joerg.krause@embedded.rocks>
References: <20180909094317.10873-1-joerg.krause@embedded.rocks>
Message-ID: <20180909151344.2eadead8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 11:43:17 +0200, J?rg Krause wrote:
> Commit b06639cf7a adds an upstream patch to fix a build issue with soxr.

I don't have any commit with the hash b06639cf7a in Buildroot. Are you
talking about e047dee241fe0660d92311a124757065c6c4c93d instead ?

> Should be committed to 2018.02.x and 2018.05.x, too.

Well e047dee241fe0660d92311a124757065c6c4c93d was not backported to
2018.02.x and 2018.05.x. Are you sure 2018.02.x and 2018.05.x are
affected by the soxr build issue that
e047dee241fe0660d92311a124757065c6c4c93d is fixing ? Indeed, I don't
see any autobuilder failure:
http://autobuild.buildroot.net/?reason=shairport%.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
