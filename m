From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 23:44:31 +0200
Subject: [Buildroot] [PATCH v6] package/python-pillow: new package
In-Reply-To: <1467233456-17500-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1467233456-17500-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160705234431.5d6f425c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 22:50:56 +0200, Angelo Compagnucci wrote:
> This patch adds python pillow, the friendly python image library fork, it
> includes a backported patch to disable configuration platfom guessing.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied, after doing a number of changes:

    [Thomas:
     - Rewrap Config.in help text.
     - As suggested by Bernd Kuhls, bump the version to 3.3.0 and drop the
       patch that has been applied upstream.
     - Rework the optional dependency handling to follow what we do in most
       Buildroot packages.
     - Add licensing information.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
