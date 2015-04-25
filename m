From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:10:47 +0200
Subject: [Buildroot] [PATCH 1/3] package/bullet: new package
In-Reply-To: <1429904773-460-2-git-send-email-romain.naour@openwide.fr>
References: <1429904773-460-1-git-send-email-romain.naour@openwide.fr>
 <1429904773-460-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150425111047.14993e9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 24 Apr 2015 21:46:11 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/Config.in        |  1 +
>  package/bullet/Config.in | 10 ++++++++++
>  package/bullet/bullet.mk | 18 ++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/bullet/Config.in
>  create mode 100644 package/bullet/bullet.mk

Applied, after doing the following minor changes:

    [Thomas:
      - move package to 'Libraries -> Graphics'
      - wrap the Config.in help text
      - change license from "Zlib" to "zlib license" to match what the
        zlib package is doing.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
