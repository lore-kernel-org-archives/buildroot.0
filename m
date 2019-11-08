From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri,  8 Nov 2019 09:41:09 -0800
Subject: [Buildroot] [PATCH 0/3] ARC buildroot fixes/updates
Message-ID: <20191108174112.28183-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have some fixes/updates from ongoing glibc work.
Please review/apply.

Thx,
-Vineet

Vineet Gupta (3):
  arch/config.in.arc: Introduce the ARC optimized hs38 config
  arch/config.in.arc: Introduce ARC ISA toggle to ease downstream
    toggles
  package/ffmpeg: Enable ARC glibc builds

 arch/Config.in.arc       | 44 ++++++++++++++++++++++++++++++++--------
 package/ffmpeg/Config.in |  2 --
 2 files changed, 36 insertions(+), 10 deletions(-)

-- 
2.20.1
