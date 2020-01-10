From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 20:44:32 +0100
Subject: [Buildroot] [PATCH v1 3/4] package/docker-engine: bump to
 19.03.5
In-Reply-To: <87y2ulle8u.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 05 Jan 2020 23:39:29 +0100")
References: <20191203045003.145746-1-christian@paral.in>
 <20191203045003.145746-3-christian@paral.in>
 <87y2ulle8u.fsf@dell.be.48ers.dk>
Message-ID: <87v9pjksf3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> ---
 >> ...ix-faulty-runc-version-commit-scrape.patch | 45 -------------------
 >> package/docker-engine/docker-engine.hash      |  2 +-
 >> package/docker-engine/docker-engine.mk        |  2 +-
 >> 3 files changed, 2 insertions(+), 47 deletions(-)
 >> delete mode 100644 package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch

 > Committed after updating the commit message to clarify that this is a
 > security bump, thanks.

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
