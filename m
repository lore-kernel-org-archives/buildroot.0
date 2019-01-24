From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:43:49 +0100
Subject: [Buildroot] [PATCH 1/1] swupdate: disable lua in static build
In-Reply-To: <20190111143312.1498-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 11 Jan 2019 15:33:12 +0100")
References: <20190111143312.1498-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7jqf4cq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since version 2018.11 and
 > https://github.com/sbabic/swupdate/commit/624904cc18003fae413011563dac83a333f10509,
 > bindings for LUA is a shared library so disable lua if BR2_STATIC_LIBS
 > is set

 > Fixes:
 >  - http://autobuild.buildroot.org/results/55767e58c211656558af7916a4e0975089a2785b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
