From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 14:02:04 +0100
Subject: [Buildroot] [PATCH 02/11] package/connman: clarify license of
 client code
In-Reply-To: <20191113151724.12155-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Nov 2019 16:17:15 +0100")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-3-peter@korsgaard.com>
Message-ID: <87sgmlqqwj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > While the core connman code is licensed under GPL-2.0, the client code is
 > GPL-2.0+ for compatibility with readline (which is GPL-3.0+).

 > Extend the _LICENSE with this info to clarify that linking against
 > readline is OK licensing wise.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
