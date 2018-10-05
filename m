From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 20:26:10 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: depends on gcc >= 4.8
In-Reply-To: <20180920220118.3497-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 21 Sep 2018 00:01:18 +0200")
References: <20180920220118.3497-1-fontaine.fabrice@gmail.com>
Message-ID: <87y3bc2qt9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > sleep_for is not always defined with gcc <= 4.7, see
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52680

 > To fix this issue, add a dependency to gcc >= 4.8

 > Fixes:
 >  - http://autobuild.buildroot.net/results/0dada8dd727f32a4500670f6620adb05943ed0b7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
