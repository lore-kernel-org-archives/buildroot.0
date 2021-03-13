From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 16:05:59 +0100
Subject: [Buildroot] [PATCH v1] package/util-linux: disable runuser for
 the host build
In-Reply-To: <20210227155413.15809-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 27 Feb 2021 16:54:13 +0100")
References: <20210227155413.15809-1-ps.report@gmx.net>
Message-ID: <87czw33xgo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes host build in case unsuitable libs are found on the system
 > (see [1]).

 > [1] http://lists.busybox.net/pipermail/buildroot/2021-February/304261.html

 > Reported-by: GA K <guyarkam@gmail.com>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
