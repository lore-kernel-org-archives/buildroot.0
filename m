From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 11:53:52 +0200
Subject: [Buildroot] [PATCH] system: add option to pass extra args to
	post-build and post-image scripts
In-Reply-To: <20130710112939.3cfc5b3b@skate> (Thomas Petazzoni's message of
 "Wed, 10 Jul 2013 11:29:39 +0200")
References: <1373393196-19024-1-git-send-email-yann.morin.1998@free.fr>
 <20130709183505.GB3543@free.fr> <20130710091628.1d01d59c@skate>
 <20130710112939.3cfc5b3b@skate>
Message-ID: <8738rmhhan.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Wed, 10 Jul 2013 09:16:28 +0200, Thomas Petazzoni wrote:

 >> Regarding the patch itself, I'd say why not. I'm just wondering if it
 >> wouldn't be better to have separate arguments for both scripts. Not
 >> sure.

 Thomas> Ok, I see that it has already been committed, without more
 Thomas> discussion... Fair enough.

I commented here and on IRC that I didn't really find it nice, but
didn't see any better way of doing it. Your comment seemed to be in line
with that, so I applied.

But I agree, perhaps it would be better to have seperate options for post-build/post-image.

-- 
Bye, Peter Korsgaard
