From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 28 Mar 2014 22:24:48 +0100
Subject: [Buildroot] [PATCH 7/9] manual/contribute.txt: reword part about
	versioning patches
In-Reply-To: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1396041895-29533-8-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/contribute.txt |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 47494cb..b641ff2 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -270,7 +270,9 @@ Changes v1 -> v2:
 
 Any patch revision should include the version number. The version number
 is simply composed of the letter +v+ followed by an +integer+ greater or
-equal to two (i.e. "PATCH v2", "PATCH v3" ...).
+equal to two (i.e. "PATCH v2", "PATCH v3" ...). Note that when your patch
+series is introduced by a cover letter, an overall patch version may be
+added to the cover letter in addition/instead to the individual commits.
 
 This can be easily handled with +git format-patch+ by using the option
 +--subject-prefix+:
-- 
1.7.9.5
