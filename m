From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 13:04:35 -0700
Subject: [Buildroot] [PATCH 0/2] Resubmit converted gentargets
Message-ID: <1286309077-26567-1-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As Thomas pointed out, gentargets can use post patch hooks. I've changed these
two packages to apply the debian patches in the post patch hooks.

[PATCH 1/2] input-tools: convert to gentargets
[PATCH 2/2] mii-diag: convert to gentargets and bump to 2.11.3
