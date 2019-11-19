From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 08:39:25 +0100
Subject: [Buildroot] [PATCH 07/11] package/lvm2: drop optional readline
 dependency
In-Reply-To: <20191113151724.12155-8-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Nov 2019 16:17:20 +0100")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-8-peter@korsgaard.com>
Message-ID: <87tv70pb6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > lvm2 is licensed under GPL-2.0, which is not license compatible with
 > readline (GPL-3.0+), so drop the optional dependency and add a comment
 > explaining why.

 > Notice: The readline support is only used when the raw lvm tool is called
 > without arguments.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
