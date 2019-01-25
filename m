From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 08:28:37 +0100
Subject: [Buildroot] [PATCH v2 3/7] tpm2-tools: always disable hardening
 options
In-Reply-To: <20190115101522.21042-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 15 Jan 2019 11:15:18 +0100")
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-3-peter@korsgaard.com>
Message-ID: <87ftthb3h6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Building with --enable-hardening (the default), forces -fstack-protector-all
 > / FORTIFY_SOURCE=2.  These options are now controlled Buildroot wide with
 > the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options.  Disable hardening so the
 > ssp/fortify settings in the toolchain wrapper / CFLAGS is used instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
