From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Oct 2012 22:05:01 +0200
Subject: [Buildroot] [git commit] package: add gnupg
In-Reply-To: <507DB21F.1090506@mind.be>
References: <20121015082204.6813A99871@busybox.osuosl.org>
 <20121016185610.36a03eff@skate>
 <87ipaatf0w.fsf@macbook.be.48ers.dk> <507DB21F.1090506@mind.be>
Message-ID: <20121016220501.727796ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 16 Oct 2012 21:14:39 +0200, Arnout Vandecappelle wrote:

>   I think this is the reason why gnupg wasn't included before.  My
> colleague Stijn submitted a patch series for a more recent version of
> gnupg a while ago, and that also faced a portability problem (in the
> 'portable threads library :-) Thomas suggested to wait for npth-based
> gnupg 2.1, but that one hasn't been released yet.

I think the problem with Stinj version was due to the usage of gnupg
2.x, and I suggested to either wait for 2.1 to solve the usage of the
non-portable pth library, or fall back to an older version such as
1.4.x, which Peter did.

That said, my memories on this are quite blurry, so I might be wrong
here. I'd have to look through the archives.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
