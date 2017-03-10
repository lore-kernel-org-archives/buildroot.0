From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 17:19:35 +0100
Subject: [Buildroot] [PATCH] lxc: add upstream security fix for
	CVE-2017-5985
In-Reply-To: <20170310130400.8425-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 10 Mar 2017 14:04:00 +0100")
References: <20170310130400.8425-1-peter@korsgaard.com>
Message-ID: <87shml85pk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Before this commit, lxc-user-nic could potentially have been tricked into
 > operating on a network namespace over which the caller did not hold
 > privilege.

 > This commit ensures that the caller is privileged over the network namespace
 > by temporarily dropping privilege.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
