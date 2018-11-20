From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 08:18:10 +0100
Subject: [Buildroot] [PATCH v3 2/3] make: drop gnumake/gmake aliases for
 host-make
In-Reply-To: <20181119162515.20360-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Nov 2018 17:25:14 +0100")
References: <20181119162515.20360-1-peter@korsgaard.com>
 <20181119162515.20360-2-peter@korsgaard.com>
Message-ID: <87pnv0p68d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Now that glibc no longer checks for gnumake / gmake, these aliases can be
 > removed.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > v3: No changes
 > v2: No changes

Committed, thanks.

-- 
Bye, Peter Korsgaard
