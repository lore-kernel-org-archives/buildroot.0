From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 21:49:48 +0200
Subject: [Buildroot] [PATCH 1/1] mosquitto: security bump to version
 1.5.3
In-Reply-To: <20180928212207.21878-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 28 Sep 2018 23:22:07 +0200")
References: <20180928212207.21878-1-fontaine.fabrice@gmail.com>
Message-ID: <87murs18df.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2018-12543. If a message is sent to Mosquitto with a topic that
 > begins with $, but is not $SYS, then an assert that should be unreachable is
 > triggered and Mosquitto will exit.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
