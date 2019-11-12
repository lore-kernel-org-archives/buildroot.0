From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Tue, 12 Nov 2019 07:34:42 -0800
Subject: [Buildroot] [PATCH v2 0/1] ARC updates/fixes
Message-ID: <20191112153443.15715-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have some fixes/updates from ongoing glibc work.
Please review/apply.

P.S. retaining the cover letter despite 1 patch to capture the revision
history of original multi-patch submission.

Chances since v1
 - 1/3 reworked as suggested (details in patch itself)
 - 2/3 dropped as it didn't seem to be adding too much value
 - 3/3 dropped as it is accepted upstream

Thx,
-Vineet

Vineet Gupta (1):
  arch/config.in.arc: Introduce the ARC optimized hs38 config

 arch/Config.in.arc | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.20.1
