From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 23:13:26 +0100
Subject: [Buildroot] [PATCH] configs/avenger96_defconfig: linux build
 needs host-openssl
In-Reply-To: <20210211132311.22508-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 11 Feb 2021 14:23:11 +0100")
References: <20210211132311.22508-1-peter@korsgaard.com>
Message-ID: <87blcqi77d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the gitlab build:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385566/

 >   HOSTCC  scripts/extract-cert
 > scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
