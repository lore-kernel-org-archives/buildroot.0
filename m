From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Mar 2012 22:32:22 +0100
Subject: [Buildroot] Where does post-build script belong?
In-Reply-To: <CAAXf6LUS+aYLQ3vneJKJMd+4TNQ6UGH+rAywr4k6C1Z4AXe7Pg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 29 Feb 2012 08:41:07
 +0100")
References: <jhub5r$smv$1@dough.gmane.org> <jijhcf$a6d$1@dough.gmane.org>
 <4F4D4FE4.3020506@gmail.com> <201202282219.30414.arnout@mind.be>
 <CAAXf6LUS+aYLQ3vneJKJMd+4TNQ6UGH+rAywr4k6C1Z4AXe7Pg@mail.gmail.com>
Message-ID: <87ehssp6zd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 >> ?If you ask me, BR2_ROOTFS_SKELETON_CUSTOM_PATH is indeed useless and
 >> should be deprecated.

 Thomas> Although I'm not using it myself, I don't think this needs to be
 Thomas> deprecated. I can imagine that there are users who have a
 Thomas> significantly different skeleton that it would be a nuisance to have
 Thomas> to tweak it from a script.

 Thomas> Although we may recommend in the docs to use the post-build script +
 Thomas> rootfs-additions, I would keep the custom option as well.

Agreed. It doesn't add much complexity to BR, and we've had it for a
very long time, so chances are people are using it (E.G. I know some
people at work do).

-- 
Bye, Peter Korsgaard
