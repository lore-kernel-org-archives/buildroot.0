From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 21:41:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix build with 64 bits
 time_t
In-Reply-To: <20201114215303.951794-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Nov 2020 22:53:03 +0100")
References: <20201114215303.951794-1-fontaine.fabrice@gmail.com>
Message-ID: <877dql3ugj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build of qemu 5.0.0 and above with 64 bites time_t
 > Fixes:
 >  - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

Don't forget to submit the patch upstream.

-- 
Bye, Peter Korsgaard
