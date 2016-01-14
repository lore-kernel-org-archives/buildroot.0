From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Thu, 14 Jan 2016 14:55:54 +0300
Subject: [Buildroot] [PATCH 0/2] Disabling trousers package for ARC
Message-ID: <1452772556-18734-1-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series disables trousers package and TPM tools package for ARC.
Because ARC gcc doesn't really support PIE option for user-space applications.
and trousers configure scripts don't provide any options which can disable 
pie usage.

Lada Trimasova (2):
  Disabling trousers package for ARC
  Disabling TPM TOOLS for ARC

 package/tpm-tools/Config.in | 1 +
 package/trousers/Config.in  | 1 +
 2 files changed, 2 insertions(+)

-- 
2.5.0
