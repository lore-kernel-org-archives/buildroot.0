From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Mar 2018 23:03:04 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] jsoncpp: do not always build static library
In-Reply-To: <20180307214703.15105-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 7 Mar 2018 22:47:03 +0100")
References: <20180307214703.15105-1-fontaine.fabrice@gmail.com>
Message-ID: <87y3j3lf1j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Currently, static libray is always built as BUILD_STATIC_LIBS is ON by
 > default so correctly set BUILD_STATIC_LIBS depending on BR2_SHARED_LIBS
 > variable

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Only set BUILD_STATIC_LIBS and not BUILD_SHARED_LIBS as it is already
 > set by the build system

Committed, thanks.

-- 
Bye, Peter Korsgaard
