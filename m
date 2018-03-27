From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Mar 2018 09:44:36 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-03-26
In-Reply-To: <20180327091525.7e785751@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 27 Mar 2018 09:15:25 +0200")
References: <20180327060026.543B0206F3@mail.bootlin.com>
 <20180327064509.n3kp4rdolibyqwud@sapphire.tkos.co.il>
 <20180327091525.7e785751@windsurf.home>
Message-ID: <87in9it123.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > So I see two options:

 >  (1) Re-introduce a "core-dependencies" target, that is the same as the
 >      "dependencies" target

 >  (2) Tweak the autobuild-run script, and make a special case depending
 >      on the branch name: if we're on 2018.02.x, use "core-dependencies",
 >      otherwise use "dependencies".

 > Arnout, Peter, any preference ? I'm leaning towards (2) since that's
 > the solution that doesn't pollute Buildroot with unnecessary stuff.

I agree. It does mean that we need all autobuilders to update, but that
shouldn't be a big problem.

-- 
Bye, Peter Korsgaard
