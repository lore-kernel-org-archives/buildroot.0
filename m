From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 07:19:45 +0200
Subject: [Buildroot] [PATCH 1/1] udftools: fix build with glibc 2.28
In-Reply-To: <20181014181138.22326-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 14 Oct 2018 20:11:38 +0200")
References: <20181014181138.22326-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhvfokge.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
 > and therefore <sys/sysmacros.h> must be included explicitly when
 > major()/minor() are used.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/33cb370ee80d0603974b6376f0364f914d150463

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
