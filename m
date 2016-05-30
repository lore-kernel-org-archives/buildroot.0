From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 09:03:30 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/helper: don't follow symlinks
	when copying libs to target
In-Reply-To: <CAAXf6LX3RRscc9VFy-5WGROHCD-qjG=hMzP2R5uXnJQX8JDwQA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 30 May 2016 08:58:48
 +0200")
References: <cover.1464534979.git.yann.morin.1998@free.fr>
 <16dd334fb29148489afa344c652208a4c512f445.1464534979.git.yann.morin.1998@free.fr>
 <CAAXf6LXQ0Ncmh71qb48dS3isFhePWkbpqyvH5ZjFX=isQLVvTg@mail.gmail.com>
 <20160529211224.GC29556@free.fr>
 <95e5afb7-0922-92cd-8ef7-7807f833b6f6@mind.be>
 <CAAXf6LX3RRscc9VFy-5WGROHCD-qjG=hMzP2R5uXnJQX8JDwQA@mail.gmail.com>
Message-ID: <87vb1w2fjx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > I'm baffled by the statement "It seems to work without just because
 > STAGING_DIR happens to be defined with a trailing slash". This must
 > have been derived from the observation that things worked without
 > -L/-follow and making the assumption that it must have been due to a
 > trailing slash without actually verifying that.

 > Anyway, if it works with plain find, all the better.
 > Sorry for all this confusion.
 > Let's consider it a good lesson in not making assumptions :-)

Heh ;)

Ok, I'll commit a simplified version of the patch (just dropping -L)
with an updated description - Thanks all!

-- 
Venlig hilsen,
Peter Korsgaard 
