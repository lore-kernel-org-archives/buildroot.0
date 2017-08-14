From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:44:27 +0200
Subject: [Buildroot] [PATCH/2017.02.x 1/2] dbus: bump version to 1.10.22
In-Reply-To: <1502372823-31706-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1502372823-31706-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20170814224427.2adfb1c3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Aug 2017 15:47:02 +0200, S?bastien Szymanski wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> (cherry picked from commit 29f0bd345bde90fcf0060c33623ade34fa9c288c)
> Change site to https to avoid a redirection.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

What is the justification for bumping dbus in the 2017.02.x maintenance
branch ? This seems like an invasive change.

If it's just to avoid the delay issue with expat 2.2.1, why not
backport the dbus patch on 1.10.16 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
