From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:33:48 +0100
Subject: [Buildroot] [PATCH 1/4] kvm-unit-test: x86-64 variant only
 available on x86-64 hosts
In-Reply-To: <20171102104520.29257-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 2 Nov 2017 11:45:17 +0100")
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-2-peter@korsgaard.com>
Message-ID: <87bmjohj9v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > We use the host compiler for x86-64 builds, so ensure it is only available
 > on x86-64 hosts.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
