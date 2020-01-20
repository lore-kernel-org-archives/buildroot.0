From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 08:39:18 +0100
Subject: [Buildroot] [PATCH 3/3] package/xen: add upstream security fix
 for XSA-312
In-Reply-To: <20200119170358.5408-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 19 Jan 2020 18:03:58 +0100")
References: <20200119170358.5408-1-peter@korsgaard.com>
 <20200119170358.5408-3-peter@korsgaard.com>
Message-ID: <87muaipoex.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > XSA-312: arm: a CPU may speculate past the ERET instruction

 > For further details, see the advisory:

 > https://xenbits.xenproject.org/xsa/advisory-312.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
