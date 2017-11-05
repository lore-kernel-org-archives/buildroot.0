From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 21:29:47 +0100
Subject: [Buildroot] [PATCH 1/8] libselinux: bump to 2.7
In-Reply-To: <2953b871-102e-5fdf-4be5-80d9cbb85be0@mind.be> (Arnout
 Vandecappelle's message of "Tue, 10 Oct 2017 12:20:51 +0200")
References: <20171009222731.15119-1-Adamduskett@outlook.com>
 <8f8f5547-b7f4-8172-4989-36a5d8767c16@mind.be>
 <20171010103540.44ee4777@windsurf.lan>
 <2953b871-102e-5fdf-4be5-80d9cbb85be0@mind.be>
Message-ID: <87h8u8zcxw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  That said, I'm not such a sucker for bisectability anyway. Bisecting is rarely
 > useful in Buildroot, since you usually know pretty well which commits may have
 > broken things (and AFAIK git bisect has no option to specify "only consider
 > patches affecting these subdirs"). And when it's a series anyway, it's pretty
 > unlikely that the bisect gets stuck in the middle of the series.

Actually it does: git bisect start -- <paths>

 >  So possibly the least effort approach is: fine-grained patches, don't comment
 > on their bisectability, and committer may squash if they feel like it.

Agreed.

-- 
Bye, Peter Korsgaard
