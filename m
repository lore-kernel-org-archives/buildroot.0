From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2014 10:00:17 +0100
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix tab/space formatting in
	init.d script
In-Reply-To: <1395972526-2048-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Thu, 27 Mar 2014 22:08:46 -0400")
References: <1395972526-2048-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87mwgag0ke.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > The S59snmpd script has a strange mix of tabs and spaces.  Replace
 > tabs with spaces, and also remove unnecessary line continuations
 > from the start-stop-daemon lines, as none of them go beyond 80
 > columns.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
