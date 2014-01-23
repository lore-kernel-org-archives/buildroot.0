From: Jonas Jensen <jonas.jensen@gmail.com>
Date: Thu, 23 Jan 2014 16:31:43 +0100
Subject: [Buildroot] [git commit] arch: pass cpu option instead of tune
 option on ARM
In-Reply-To: <20131226222002.C88A59C1E4@busybox.osuosl.org>
References: <20131226222002.C88A59C1E4@busybox.osuosl.org>
Message-ID: <CACmBeS0dY9NiAPJCTzSQGSH_zx71HN00MJ6Xk0_jD8DjyDwBRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Moving from snapshot 20131213 to 20140123 I noticed a warning that
wasn't there before:

"warning: switch -mcpu=fa526 conflicts with -march=armv4 switch
[enabled by default]"

That's where I started digging and found this commit.

In cases where -mcpu is set, buildroot doesn't actually need to set
-march, correct?

I can live with the warning I'm just letting you know. Thanks for
buildroot it's a great tool :)

Best regards,
Jonas
