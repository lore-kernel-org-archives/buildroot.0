From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Dec 2019 16:20:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/webrtc-audio-processing: needs
 host-pkgconf
In-Reply-To: <20191213222346.126207-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 13 Dec 2019 23:23:46 +0100")
References: <20191213222346.126207-1-fontaine.fabrice@gmail.com>
Message-ID: <87a77vexxm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > configure fails if the pkgconfig.m4 macros are not available during
 > this package autoreconf:

 > ./configure: line 11829: syntax error near unexpected token `GNUSTL,'
 > ./configure: line 11829: `  PKG_CHECK_MODULES(GNUSTL, gnustl)'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9cbdfb76ea38864fce1acca88714c48c41c77255

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
