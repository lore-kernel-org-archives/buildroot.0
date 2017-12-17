From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 10:32:44 +0100
Subject: [Buildroot] [PATCH 3/3] package/shapelib: version bump,
 use the new autotools build config and add new dependency on proj
In-Reply-To: <1513468381-8875-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1513468381-8875-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1513468381-8875-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20171217103244.0547496d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Dec 2017 00:53:01 +0100, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/shapelib/Config.in     |  5 +++++
>  package/shapelib/shapelib.hash |  2 +-
>  package/shapelib/shapelib.mk   | 17 +++--------------
>  3 files changed, 9 insertions(+), 15 deletions(-)

I've applied, after adding the thread dependency (as noticed by Baruch)
and tweaking the commit log (your commit title was too long).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
