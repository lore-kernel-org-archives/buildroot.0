From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:51:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/matchbox: add missing expat
 dependency
In-Reply-To: <20200508145641.1716629-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 May 2020 16:56:41 +0200")
References: <20200508145641.1716629-1-fontaine.fabrice@gmail.com>
Message-ID: <87lflzsh4r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > matchbox selects expat but does not add it to its dependency resulting
 > in the following build failure:

 > configure: error: cannot find expat library
 > make: *** [/home/buildroot/autobuild/run/instance-2/output-1/build/matchbox-1.2/.stamp_configured] Error 1

 > Fixes:
 >  - http://autobuild.buildroot.org/results/37021f1d7fcfd890011068a28ce6181dc509e746

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
