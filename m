From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:35:48 +0100
Subject: [Buildroot] [PATCH 1/3] obsidian_cursors: new package
In-Reply-To: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151219153548.11b5c73e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 13 Nov 2015 16:37:03 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                              |  5 ++++-
>  package/obsidian_cursors/Config.in             |  6 ++++++
>  package/obsidian_cursors/obsidian_cursors.hash |  2 ++
>  package/obsidian_cursors/obsidian_cursors.mk   | 18 ++++++++++++++++++
>  4 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 package/obsidian_cursors/Config.in
>  create mode 100644 package/obsidian_cursors/obsidian_cursors.hash
>  create mode 100644 package/obsidian_cursors/obsidian_cursors.mk

Applied, after doing some changes:

    [Thomas:
     - rename from obsidian_cursors to obsidian-cursors
     - change prompt from obsidian to obsidian-cursors in order to match
       with the package name.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
