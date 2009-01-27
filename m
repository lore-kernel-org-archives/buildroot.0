From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 27 Jan 2009 11:52:12 +1100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/package/multimedia/mplayer
In-Reply-To: <20090126092249.54682768D3@busybox.osuosl.org>
References: <20090126092249.54682768D3@busybox.osuosl.org>
Message-ID: <20090127005212.GC1083@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 26, 2009 at 09:22:48AM +0000, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2009-01-26 09:22:47 +0000 (Mon, 26 Jan 2009)
> New Revision: 25046
> 
> Log:
> mplayer: add patch due to missing sys/timeb.h

I had a similar problem building OpenSSL with uclibc 0.9.30. I will fix
it later today if I get a chance.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
