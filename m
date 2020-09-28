From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 23:02:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: fix build
 failure without pod2man
In-Reply-To: <20200915190556.605608-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 15 Sep 2020 21:05:56 +0200")
References: <20200915190556.605608-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8lpzkaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set ac_cv_path_POD2MAN to true to avoid the following build failure:
 > checking for pod2man... no
 > configure: error: I couldn't find pod2man; make sure it's installed and in your path

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7a3a182aa91a07a720a02f854c59f952930708e1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
