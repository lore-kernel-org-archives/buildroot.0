From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 22:34:55 +0200
Subject: [Buildroot] [PATCH 1/1] screen: fix parallel build
In-Reply-To: <20181003210624.3085-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 3 Oct 2018 23:06:24 +0200")
References: <20181003210624.3085-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1mwyvww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > comm.h is needed to build list_display.o and list_generic.o otherwise
 > parallel builds will sometimes fail

 > Fixes:
 >  - http://autobuild.buildroot.org/results/43105f14857dbe72d8878fc7b3db67f7bdca93cc
 >  - http://autobuild.buildroot.org/results/47f4ecbec1355285633df287fc9c4e7cccde9378

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
