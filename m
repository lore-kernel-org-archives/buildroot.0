From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Dec 2016 10:36:45 +0100
Subject: [Buildroot] [PATCH] package/google-breakpad: really fix the
	C++11 dependency
In-Reply-To: <1482358027-5386-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Wed, 21 Dec 2016 23:07:07 +0100")
References: <1482358027-5386-1-git-send-email-romain.naour@gmail.com>
Message-ID: <877f6s1f0y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The C++11 build issue is still here since the C++11 is not complete in
 > gcc 4.7 [1]. So disable Google-breakpad for toolchains based on
 > gcc <= 4.7.

 > [1] https://gcc.gnu.org/gcc-4.7/cxx0x_status.html

 > Fixes:
 > http://autobuild.buildroot.net/results/c5e/c5e629f26bf6da369dff1e4588c16d2773173e9f

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
