From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 12:15:40 +0100
Subject: [Buildroot] [PATCH] python-txtorcon: needs C++ support
In-Reply-To: <20180121220916.27851-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 21 Jan 2018 23:09:16 +0100")
References: <20180121220916.27851-1-peter@korsgaard.com>
Message-ID: <87fu6yb0v7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Python-txtorcon selects python-pyopenssl and python-service-identity, both
 > (indirectly) needing C++ support, so propagate that dependency.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
