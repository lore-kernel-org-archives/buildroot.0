From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 10:50:31 +0100
Subject: [Buildroot] Random build results now available online
In-Reply-To: <20120321104212.553e3805@skate> (Thomas Petazzoni's message of
 "Wed, 21 Mar 2012 10:42:12 +0100")
References: <20120321101327.49d34f93@skate>
 <87fwd25mne.fsf@macbook.be.48ers.dk> <20120321104212.553e3805@skate>
Message-ID: <87bonq5llk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> How about adding a .buildroot.{net,org} DNS entry for it, though? How
 >> about autobuild.buildroot.{net,org} or something like that?

 Thomas> As discussed on IRC, done on my side (Apache configuration). Provided
 Thomas> the DNS entries are added and pointed to 213.246.36.146, it should work.

The DNS (cname) records are added now.

http://autobuild.buildroot.net
http://autobuild.buildroot.org

 >> We can perhaps talk with the osuosl.org guys about that.

 Thomas> Right. I have no problem to continue hosting this, it's just that I
 Thomas> think things are better if they are centralized on a server that
 Thomas> at least a few Buildroot developers have access to.

True. Having the code in git is already a good start though.

-- 
Bye, Peter Korsgaard
