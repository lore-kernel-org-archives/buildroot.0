From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:46:43 +0100
Subject: [Buildroot] [PATCH 2/2] linux{,
 -headers}: support downloads of v5+
In-Reply-To: <20190306212815.19759-2-arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 6 Mar 2019 22:28:15 +0100")
References: <20190306212815.19759-1-arnout@mind.be>
 <20190306212815.19759-2-arnout@mind.be>
Message-ID: <87ef6uk7gs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > With the arrival of linux v5.0, we need yet another condition to set
 > _SITE correctly. Instead of continuing this madness, solve the problem
 > generically: use v2.6 for 2.6.*, and use the number before the first dot
 > in the other cases.

 > While we're at it, remove the comment which has been incorrect since
 > 80d7b68167a5c8893e906ace6b5f0b0166336406 (7 years ago).

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
