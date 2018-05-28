From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:24:27 +0200
Subject: [Buildroot] [PATCH v2,1/1] libcap: only install shared version
In-Reply-To: <20180509084305.18797-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 9 May 2018 10:43:05 +0200")
References: <20180509084305.18797-1-fontaine.fabrice@gmail.com>
Message-ID: <87lgc3yi1w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > If BR2_SHARED_LIBS is set, only install shared version of library
 > (continue to build both libraries through all target as there is no
 > libcap.so target but only a libcap.so.$(VERSION).$(MINOR))

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update to have a clearer approach

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
