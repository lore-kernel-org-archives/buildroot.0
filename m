From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Apr 2015 22:43:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Re-number patch 0014 to 0015
Message-ID: <1428525839-1939-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Got it wrong in
http://git.buildroot.net/buildroot/commit/?id=032e2beedfe7f503f0686470ae930d4c8b41b780

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...unnecessary-calls.patch => 0015-hevc-avoid-unnecessary-calls.patch} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/ffmpeg/{0014-hevc-avoid-unnecessary-calls.patch => 0015-hevc-avoid-unnecessary-calls.patch} (100%)

diff --git a/package/ffmpeg/0014-hevc-avoid-unnecessary-calls.patch b/package/ffmpeg/0015-hevc-avoid-unnecessary-calls.patch
similarity index 100%
rename from package/ffmpeg/0014-hevc-avoid-unnecessary-calls.patch
rename to package/ffmpeg/0015-hevc-avoid-unnecessary-calls.patch
-- 
1.7.10.4
