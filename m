From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:04:25 +0100
Subject: [Buildroot] [git commit] qextserialport: fix line endings in
 patch 0002
In-Reply-To: <24560a5e-b297-7406-e3ba-e9b1a933922b@mind.be>
References: <20161125214131.8C49E80DB5@busybox.osuosl.org>
 <24560a5e-b297-7406-e3ba-e9b1a933922b@mind.be>
Message-ID: <20161126150425.6084a4e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 11:48:57 +0100, Arnout Vandecappelle wrote:

>  Didn't I warn about this in the commit message?

Yes, you did. I saw it the first time I looked at the patch, but then
forgot when actually applying later in the day. Which is why I fixed it
afterwards.

>  To avoid this kind of problem in the future, perhaps we should add
> --ignore-whitespace to our patch calls?

You mean when applying the patches? Apparently, git am takes a
--ignore-space-change option, could be worth trying next time.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
