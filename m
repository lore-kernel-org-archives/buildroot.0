From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Apr 2020 09:53:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/netdata: link with libatomic
 when needed
In-Reply-To: <20200330210750.446080-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 30 Mar 2020 23:07:50 +0200")
References: <20200330210750.446080-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8s957kh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > netdata uses __atomic_fetch_add_2
 > Fixes:
 >  - http://autobuild.buildroot.org/results/1eb033ba7bf85ba3e25572a106f08faf49cd05b2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
