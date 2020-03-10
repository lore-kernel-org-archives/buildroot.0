From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:28:43 +0100
Subject: [Buildroot] [PATCH] package/runc: security bump to version
 1.0.0-rc10
In-Reply-To: <20200205125042.31122-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 5 Feb 2020 13:50:41 +0100")
References: <20200205125042.31122-1-peter@korsgaard.com>
Message-ID: <87lfo7oq5w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > - CVE-2019-19921: runc volume mount race condition with shared mounts

 > For details see the announcement:
 > https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc10

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
