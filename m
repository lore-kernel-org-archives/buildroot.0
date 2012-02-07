From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Tue,  7 Feb 2012 14:12:52 +0100
Subject: [Buildroot] [PATCH] sam-ba is host only
Message-ID: <1328620373-8784-1-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the guidelines from Arnout regarding host only tools


Alexandre Belloni (1):
  sam-ba is host only

 package/sam-ba/sam-ba.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.7.5.4
