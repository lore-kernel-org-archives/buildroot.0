From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2020 17:46:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/zeromq: add -latomic to
 libzmq.pc
In-Reply-To: <20200112190748.3717278-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 Jan 2020 20:07:48 +0100")
References: <20200112190748.3717278-1-fontaine.fabrice@gmail.com>
Message-ID: <87sgiuk6bz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This will fix a static build failure with czmq
 > Fixes:
 >  - http://autobuild.buildroot.org/results/4a12f1ede260cd956a0b5ccb4eec6ca8b44cb04f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
