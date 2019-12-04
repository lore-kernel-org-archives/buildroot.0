From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Dec 2019 10:46:44 +0100
Subject: [Buildroot] [PATCH v1 3/4] package/docker-engine: bump to
 19.03.5
In-Reply-To: <20191203045003.145746-3-christian@paral.in> (Christian Stewart's
 message of "Mon, 2 Dec 2019 20:50:02 -0800")
References: <20191203045003.145746-1-christian@paral.in>
 <20191203045003.145746-3-christian@paral.in>
Message-ID: <871rtkl8xn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Signed-off-by: Christian Stewart <christian@paral.in>
 >  ...ix-faulty-runc-version-commit-scrape.patch | 45 -------------------
 >  package/docker-engine/docker-engine.hash      |  2 +-
 >  package/docker-engine/docker-engine.mk        |  2 +-
 >  3 files changed, 2 insertions(+), 47 deletions(-)
 >  delete mode 100644 package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch

Next to the text cases pointed out by Thomas, a more detailed commit
message would be great - E.G. what happened to your patch that you are
now dropping? Did it get applied upstream? Is it no longer needed? If
so, why?

-- 
Bye, Peter Korsgaard
