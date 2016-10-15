From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:07:24 +0200
Subject: [Buildroot] [PATCH 13/13] Remove BR2_DEPRECATED
In-Reply-To: <20161015145107.18264-14-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 15 Oct 2016 16:51:07 +0200")
References: <20161015145107.18264-1-arnout@mind.be>
 <20161015145107.18264-14-arnout@mind.be>
Message-ID: <87oa2l7243.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The BR2_DEPRECATED logic is a lot less useful than the legacy handling,
 > because the symbols just disappears without warning to the user. For
 > example, we had a few defconfigs that were using deprecated symbols
 > (which were not actually used because BR2_DEPRECATED wasn't set) so
 > these didn't build the expected code anymore.

 > Also, the idea behind BR2_DEPRECATED is that you can easily revive it
 > again if there is interest. However, it is relatively easy to revert
 > the removal of a package as well.

 > The deprecation is also more effort because it has to be removed twice:
 > once when deprecating, and once when really removing.

 > It doesn't make sense to add a legacy entry for BR2_DEPRECATED. Users
 > who actually used it will get legacy warnings instead.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
