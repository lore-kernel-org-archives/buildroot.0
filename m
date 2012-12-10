From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Dec 2012 23:49:34 +0100
Subject: [Buildroot] [PATCH] linux-fusion: don't override CFLAGS/LDFLAGS
In-Reply-To: <1355159219-10867-1-git-send-email-arnout@mind.be>
References: <1355159219-10867-1-git-send-email-arnout@mind.be>
Message-ID: <CAHXCMML_6Q8rwVN1bvYvSb1dh1Byd1j0rLJh5Q4voOJX340=KA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/10 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>:
> Putting $(TARGET_CONFIGURE_OPTS) after $(MAKE) overrides the Makefile's
> CFLAGS and LDFLAGS. Some of these flags are required, however. So
> instead pass these things in the environment, which allows the Makefile
> to append to the flags.
>
> This removes the need for the patch, because now the correct -I options
> are added.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Samuel Martin <s.martin49@gmail.com>

Build-test only too.

> ---
> Build-test only

Reagards,

-- 
Samuel
