From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 19:04:45 +0100
Subject: [Buildroot] [PATCH 3/3] support/testing: test_dropbear.py: drop
 ssh port forward to the host
In-Reply-To: <20190205094542.12783-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 5 Feb 2019 10:45:42 +0100")
References: <20190205094542.12783-1-peter@korsgaard.com>
 <20190205094542.12783-3-peter@korsgaard.com>
Message-ID: <87imxykt6q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > It is not used and may conflict with other services running on port 2222 on
 > the host machine.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
