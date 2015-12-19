From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:39:16 +0100
Subject: [Buildroot] [PATCH 2/3] comix_cursors: new package
In-Reply-To: <1447443425-2530-2-git-send-email-gustavo@zacarias.com.ar>
References: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
 <1447443425-2530-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151219153916.7988b5ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 13 Nov 2015 16:37:04 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                        |  1 +
>  package/comix_cursors/Config.in          |  6 ++++++
>  package/comix_cursors/comix_cursors.hash |  2 ++
>  package/comix_cursors/comix_cursors.mk   | 23 +++++++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/comix_cursors/Config.in
>  create mode 100644 package/comix_cursors/comix_cursors.hash
>  create mode 100644 package/comix_cursors/comix_cursors.mk

Applied, after some changes:

    [Thomas:
     - rename from comix_cursors to comix-cursors
     - change prompt from comix to comix-cursors in order to match the
       package name
     - use <pkg>_STRIP_COMPONENTS instead of overriding the extract
       commands.
     - the license is GPLv3 according to the project website.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
