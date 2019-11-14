From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Nov 2019 09:23:55 +0100
Subject: [Buildroot] [PATCH 09/11] package/neardal: unconditionally use
 libedit
In-Reply-To: <20191113151724.12155-10-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Nov 2019 16:17:22 +0100")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-10-peter@korsgaard.com>
Message-ID: <87zhgyj278.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > neardal is licensed under GPL-2.0, which is not license compatible with
 > readline (GPL-3.0+), so always use the libedit backend.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Strangely enough I have not received your reply, neither directly or
through the list, even though I see it in the archive - I guess the mail
issues aren't over yet.

Anyway, you are right - Our license tag is apparently wrong, and I
didn't verify it.

Still, given the unclarity about LGPL-2.0 vs GPL-3.0 - And the fact that
readline is only used in the ncl utility and not in the library (and
using LGPL for an application), so I would prefer to err on the side of
caution and unconditionally use libedit.

I will send an updated series changing _LICENSE and adjusting the
commit message of this patch to refer to LGPL instead.

Thanks.

-- 
Bye, Peter Korsgaard
