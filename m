From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:34:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/open62541: force Release build
In-Reply-To: <20210128194619.4160433-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 28 Jan 2021 20:46:19 +0100")
References: <20210128194619.4160433-1-fontaine.fabrice@gmail.com>
Message-ID: <877dnwxhtt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Force Release build to remove -Werror and avoid the following build
 > failure:

 > /home/giuliobenetti/autobuild/run/instance-3/output-1/build/open62541-1.0/arch/network_tcp.c: At top level:
 > cc1: error: unrecognized command line option '-Wno-static-in-inline' [-Werror]
 > cc1: all warnings being treated as errors

 > Fixes:
 >  - http://autobuild.buildroot.org/results/24b429ce0ae2b33e72bb6a0f523c3906e539a4fd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
