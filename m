From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:38:47 +0100
Subject: [Buildroot] [PATCH 02/17] tests: add test for post-fakeroot
 script
In-Reply-To: <878bd9ac6569877450e28861cb047a93c1550eb9.1515939400.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 14 Jan 2018 15:16:58 +0100")
References: <cover.1515939400.git.yann.morin.1998@free.fr>
 <878bd9ac6569877450e28861cb047a93c1550eb9.1515939400.git.yann.morin.1998@free.fr>
Message-ID: <873736uaaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, only post-build and post-image scripts were tested, each with
 > their own test-script.

 > The two test-scripts only differ in the name of the log file they
 > create, and it is based on the name of the script, so it is easy to
 > share the script.

 > This allows us to easily re-use it for testing post-fakeroot scripts.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
