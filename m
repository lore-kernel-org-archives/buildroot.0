From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:33:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/pure-ftpd: fix CVE-2019-20176
In-Reply-To: <20200229203416.3462566-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 21:34:15 +0100")
References: <20200229203416.3462566-1-fontaine.fabrice@gmail.com>
Message-ID: <87k13mrdkd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In Pure-FTPd 1.0.49, a stack exhaustion issue was discovered in the
 > listdir function in ls.c.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
