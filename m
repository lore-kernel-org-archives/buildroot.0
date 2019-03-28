From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:52:45 +0100
Subject: [Buildroot] [PATCH] package/busybox: busybox.config: enable
 base64 applet
In-Reply-To: <20190326170749.10182-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 26 Mar 2019 18:07:48 +0100")
References: <20190326170749.10182-1-peter@korsgaard.com>
Message-ID: <87h8bnmiky.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > base64 reuses the uuencode logic, so only adds very little extra overhead,
 > is enabled by default upstream and is used more often than uuencode - So
 > enable it in the default busybox config.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
