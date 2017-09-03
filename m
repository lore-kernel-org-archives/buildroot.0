From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 13:55:03 +0200
Subject: [Buildroot] [PATCH v2] package/sysdig: fix missing curlbuild
 include
In-Reply-To: <1504426760-14252-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1504426760-14252-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170903135503.6c8572ad@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Sep 2017 10:19:20 +0200, Angelo Compagnucci wrote:
> curlbuild.h was removed in recent versinos of curl, backporting a
> patch from mainline to fix it until a newer version of sysdig is
> released.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  .../sysdig/0001-Don-t-include-curlbuild.h.patch    | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/sysdig/0001-Don-t-include-curlbuild.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
