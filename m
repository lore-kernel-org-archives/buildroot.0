From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Nov 2020 18:47:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/zeromq: add libbsd optional
 dependency
In-Reply-To: <20201102185757.79877-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 2 Nov 2020 19:57:57 +0100")
References: <20201102185757.79877-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7q1xdnr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libbsd is an optional dependency which is enabled by default since
 > version 4.3.3 and
 > https://github.com/zeromq/libzmq/commit/068385c951c0608edec6264d55ba9c4c923acccc

 > Fixes:
 >  - http://autobuild.buildroot.org/results/51220b1b82774e8f6f6ed8593c58d2e3c31a1531

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
