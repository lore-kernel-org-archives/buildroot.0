From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:36:40 +0100
Subject: [Buildroot] [PATCH 1/1] configs/bananapi_m1_plus_defconfig:
 select custom headers
In-Reply-To: <20210317151647.699472-1-fskoneczny@gmail.com> (Filip Skoneczny's
 message of "Wed, 17 Mar 2021 16:16:47 +0100")
References: <20210317151647.699472-1-fskoneczny@gmail.com>
Message-ID: <87ft0hk0ef.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Filip" == Filip Skoneczny <fskoneczny@gmail.com> writes:

 > Board used custom Kernel but did not specify
 > custom headers. This broke the build when
 > Linux 5.11 was added in d2fe9c6.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/1089053980

 > Signed-off-by: Filip Skoneczny <fskoneczny@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
