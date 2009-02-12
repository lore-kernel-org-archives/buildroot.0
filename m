From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Feb 2009 14:35:18 +0100
Subject: [Buildroot] Easy Upgrade Path?
In-Reply-To: <20090212132945.GA30222@zelow.no> (Thomas Lundquist's message of
	"Thu\, 12 Feb 2009 14\:29\:45 +0100")
References: <49907BAE.3020509@ethertek.ca> <20090212132945.GA30222@zelow.no>
Message-ID: <87k57vg4mh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:

Hi,

 >> What is the recommended method to upgrade to the newest build 
 >> environment so we don't have to re-do everything? Is this possible?

 Thomas> Ulf introduced local/ when he started to commit and this was
 Thomas> a good idea.

 Thomas> It got booted out some time later, by someone.

I don't remember the details, but it was afaik quite half baked,

 Thomas> The point is that you can put your config files and non-included 
 Thomas> packages there and keep that out of the rest of the tree.

 Thomas> I like the idea and would like to put it back in.

I agree that we should realize the fact that any big user of buildroot
want to customize it somehow and make it easy to do - But we need to
do it in a clean way.

-- 
Bye, Peter Korsgaard
