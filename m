From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Mar 2009 23:54:39 +0200
Subject: [Buildroot] Qtopia4 build issue
In-Reply-To: <20090227152717.5cefcd92@surf> (Thomas Petazzoni's message of
	"Fri\, 27 Feb 2009 15\:27\:17 +0100")
References: <20090226122205.390e848a@surf> <20090226162124.2d78cfa4@surf>
	<20090227152717.5cefcd92@surf>
Message-ID: <874ox98ijk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Thu, 26 Feb 2009 16:21:24 +0100,
 Thomas> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

 >> Ok, I think I found a fix for the issue. First of all, the problem
 >> only occurs when cross-compiling on x86 to x86. I will cleanup my fix
 >> later today or tomorrow and submit for discussion.

 Thomas> Here is a discussion patch to fix the Qtopia build issue when the
 Thomas> target architecture is x86. This patch is *not* meant for inclusion,
 Thomas> only for discussions since it has known issues and isn't very clean.

 Thomas> Please tell me if the approach seems correct. If so, I will
 Thomas> provide a cleaned up patch, suitable for inclusion.

Is this still needed? I don't normally use QT, but built it earlier
today without problems (after the fixes I committed today).

-- 
Bye, Peter Korsgaard
