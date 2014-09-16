From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 16:14:23 +0200
Subject: [Buildroot] [PATCH] celt051: Fix file naming
In-Reply-To: <1410872158-16648-1-git-send-email-jezz@sysmic.org>
References: <1410872158-16648-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140916161423.01992a6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 16 Sep 2014 14:55:58 +0200, J?r?me Pouiller wrote:
> In order to comply with naming policy, fix celt.mk filename.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/celt051/celt.mk    | 30 ------------------------------
>  package/celt051/celt051.mk | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 30 deletions(-)
>  delete mode 100644 package/celt051/celt.mk
>  create mode 100644 package/celt051/celt051.mk

Thanks, but you should use git format-patch -M to detect renames, that
will generate much shorter (and readable) patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
