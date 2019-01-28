From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:07:01 +0100
Subject: [Buildroot] [PATCH 1/1] haproxy: disable on sh4 with gcc < 7
In-Reply-To: <20190128190702.7157-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 28 Jan 2019 20:07:02 +0100")
References: <20190128190702.7157-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0ogcwzu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build fails on sh4:
 > src/dns.c:290:1: error: unable to find a register to spill in class 'R0_REGS'
 >  }

 > This build failure seems related to a known gcc bug that has been fixed
 > only in gcc 7:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60040

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2e181cc874d5389f10ecddb0d11253c3aa5e7fc4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
