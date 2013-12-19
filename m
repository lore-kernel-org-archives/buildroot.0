From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Dec 2013 16:36:22 +0100
Subject: [Buildroot] [PATCH] mdadm: pass CHECK_RUN_DIR=0 to the Makefile
	in order to fix build failure
In-Reply-To: <1387274990-6780-1-git-send-email-cvubrugier@yahoo.fr>
 (Christophe Vu-Brugier's message of "Tue, 17 Dec 2013 11:09:50 +0100")
References: <1387274990-6780-1-git-send-email-cvubrugier@yahoo.fr>
Message-ID: <8761qkont5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christophe" == Christophe Vu-Brugier <cvubrugier@yahoo.fr> writes:

 > This commit should fix build failures of mdadm 3.3:
 >   http://autobuild.buildroot.net/results/b4a/b4abc317d07b073f8be870ff0e7fee8f8c65f2ff/
 >   http://autobuild.buildroot.net/results/79e/79e6c5081a5197c4f4647db497fbd1e27f29714d/
 >   http://autobuild.buildroot.net/results/224/2242f8284aa4bdbb0ab959a6a6464f20fa043e2f/

 > Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
