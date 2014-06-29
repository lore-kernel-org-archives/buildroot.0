From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:55:18 +0200
Subject: [Buildroot] [PATCH v3 0/5] Add TARGET_FINALIZE_HOOKS
In-Reply-To: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
References: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
Message-ID: <20140629165518.34268392@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 27 Jun 2014 14:15:54 +0200, Fabio Porcedda wrote:
> This patch set add TARGET_FINALIZE_HOOKS and use it for system.mk
> recipies.
> 
> The changelog is on each patch.
> 
> Best regards
> Fabio Porcedda (5):
>   Makefile: target-finalize: add TARGET_FINALIZE_HOOKS
>   system: convert "system.mk" recipes to "target-finalize" hooks
>   Makefile: convert "toolchain-eclipse-register" to a hook
>   Makefile: convert "target-generatelocales" to a hook
>   Makefile: do not add to targets common dependencies

Thanks, series applied. I just have one comment on PATCH 2, which I'll
make as a reply to the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
