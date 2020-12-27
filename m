From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:46:50 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/mosquitto: fix static build with cjson
In-Reply-To: <20201225215032.3796886-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 25 Dec 2020 22:50:32 +0100")
References: <20201225215032.3796886-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7o7bpqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/98e0bccf3e1a964bb6a52265bd6f11a681ec220d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Korsgaard):
 >  - Use CLIENT_STATIC_LDADD instead of adding -lcjson to CLIENT_LDFLAGS
 >    in config.mk

Committed, thanks.

-- 
Bye, Peter Korsgaard
