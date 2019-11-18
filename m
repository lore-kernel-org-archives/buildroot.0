From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 14:08:17 +0100
Subject: [Buildroot] [PATCH 03/11] package/dropwatch: license is GPL-2.0+
In-Reply-To: <20191113151724.12155-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Nov 2019 16:17:16 +0100")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-4-peter@korsgaard.com>
Message-ID: <87o8x9qqm6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Dropwatch links with readline, which is GPL-3.0+, so not compatible with
 > GPL-2.0.  When asked about this, upstream has clarified that the license
 > really is GPL-2.0+:

 > https://github.com/nhorman/dropwatch/issues/14

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.08.x, thanks. 2019.02.x uses a different version, I
will try to get some feedback from upstream if GPL-2.0+ also applies
there.

-- 
Bye, Peter Korsgaard
