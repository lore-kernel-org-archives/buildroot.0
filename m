From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 01 May 2009 14:43:39 +0200
Subject: [Buildroot] goodbye svn, hello git
Message-ID: <87tz45803o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Ok, it's done - The repository is migrated to git and svn is now read
only.

My mail of last month [1] contained the details of how to access it,
but here's a small reminder:

The repo can be browsed through cgit at:

http://git.buildroot.net/buildroot/

It can be cloned anonymously using:

git clone git://git.buildroot.net/buildroot/ or
git clone http://git.buildroot.net/buildroot/ if you're behind a
firwall blocking git access.

I'll update the website later today, and daily snapshots should also
soon work again.

[1] http://lists.busybox.net/pipermail/buildroot/2009-March/026875.html

-- 
Bye, Peter Korsgaard
