From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Dec 2013 13:32:42 +0100
Subject: [Buildroot] Call for autobuild fixing for 2013.11
In-Reply-To: <CAAXf6LViMHHbhYP2joLTDYg7=KDJ8jHyMYm81COZkNdhH8AG2Q@mail.gmail.com>
References: <CAAXf6LXwy3HGGX1W9FCcdVCRJSHMT2B=w--xvcsBxqwUXxDjqg@mail.gmail.com>
 <CAAXf6LU1_ybwfA9DGfkq7fGJ17LU5k4cQb=G14rg6oSdNY=WAg@mail.gmail.com>
 <20131126142616.64719ad6@skate>
 <CAAXf6LViMHHbhYP2joLTDYg7=KDJ8jHyMYm81COZkNdhH8AG2Q@mail.gmail.com>
Message-ID: <20131202133242.26ec8cbd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 2 Dec 2013 12:11:02 +0100, Thomas De Schampheleire wrote:

> Yes, obviously I did not mean to stop fixing autobuild issues when
> 2013.11 is released.
> In fact, the amount of remaining autobuild issues at the release of
> 2013.11 was relatively small that it is imaginable that we could close
> them all... It would be great if we could reach 0 failures at some
> point for a few days. Then any new failure could be attributed to a
> recent commit, and should be fixed at once (or the commit reverted).

Yes, I must say I was impressed by how much we managed to reduce the
number of build failures.

However, it's hard to be 100% sure a failure showing is a new failure,
even if we had several days in a row with 0 failures. The number of
possible combinations is so huge that I don't think it's possible to
test all of them within a reasonable amount of time. So a "new failure"
may just be something that did exist since quite some time was that we
couldn't trigger (like was indeed by another failure, for example).

Also, another effect of having more success in the builds is that we do
less builds (statistically, successful builds take more time than
failed builds, since all successful builds run completely to the end).
Therefore, the number of builds we do each day is now below 100, which
is not enough. I think we should look at adding more autobuilders in
the future. I'll try to clean up my script so that other people can set
up autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
