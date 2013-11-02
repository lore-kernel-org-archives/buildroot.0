From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 18:35:35 +0100
Subject: [Buildroot] [PATCH v3 1/2] ngrep: rename existing patch
In-Reply-To: <1383407218-2770-1-git-send-email-romain.naour@openwide.fr>
References: <1383407218-2770-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20131102183535.31789609@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  2 Nov 2013 16:46:57 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/ngrep/{ngrep-1.45-make-objs.patch => ngrep-0001-make-objs.patch}  | 0
>  .../ngrep/{ngrep-1.45-pcre-header.patch => ngrep-0002-pcre-header.patch}  | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/ngrep/{ngrep-1.45-make-objs.patch => ngrep-0001-make-objs.patch} (100%)
>  rename package/ngrep/{ngrep-1.45-pcre-header.patch => ngrep-0002-pcre-header.patch} (100%)

Thanks, applied to for-peter-2013.11, as well as PATCH 2/2.

Note that in PATCH 2/2, you had forgotten to add your Signed-off-by to
the new ngrep patch, so I've added it for you, since you had anyway
Signed-off-by the entire patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
