From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Nov 2017 08:24:55 +0100
Subject: [Buildroot] [PATCH v1] Fix makefile include order by using
 sort/wildcard.
In-Reply-To: <20171127112925.srj7s3n62nt3u2cf@sapphire.tkos.co.il> (Baruch
 Siach's message of "Mon, 27 Nov 2017 13:29:25 +0200")
References: <20171121191330.5621-1-ps.report@gmx.net>
 <a3441ea0-b5da-d5ab-ff93-af09b1dd151d@mind.be>
 <878tesavbb.fsf@dell.be.48ers.dk>
 <20171127112925.srj7s3n62nt3u2cf@sapphire.tkos.co.il>
Message-ID: <87fu8wkz3s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> > I've fixed that one as well, I've extended the commit log a little, and applied
 >> > to master, thanks.
 >> 
 >> Committed to 2017.02.x and 2017.08.x, thanks.

 > Not in 2017.02.x as of commit 22b996fef069fe (ffmpeg: bump version to 3.2.9).

Hmm, indeed not - I wonder what happened. I've added it now.

Thanks!

-- 
Bye, Peter Korsgaard
