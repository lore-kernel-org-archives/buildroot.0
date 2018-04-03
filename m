From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 15:50:29 +0200
Subject: [Buildroot] [PATCH 1/2] prosody: fix build with musl libc
In-Reply-To: <a4acccee1aac11202402728b64d23a3f0f7128be.1522730725.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Apr 2018 07:45:24 +0300")
References: <a4acccee1aac11202402728b64d23a3f0f7128be.1522730725.git.baruch@tkos.co.il>
Message-ID: <87woxopffe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > musl libc does not provide the mallinfo() API. Define WITHOUT_MALLINFO
 > to skip the code using it.

 > Fixes:
 > http://autobuild.buildroot.net/results/42c/42cd6e3be761d1cb358bc50acd7fa58c8aa1c750/
 > http://autobuild.buildroot.net/results/29d/29d8dcbe013e549a865c0c5953272dab1fe5f777/
 > http://autobuild.buildroot.net/results/a6d/a6deb7440f80b072432c0f9c048e59abe4edf1c0/

 > Cc: Dushara Jayasinghe <nidujay@gmail.com>
 > Cc: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
