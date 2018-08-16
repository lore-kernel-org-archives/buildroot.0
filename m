From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 22:04:42 +0200
Subject: [Buildroot] [PATCH/next v2 00/23] package/vlc: bump version to
 3.0.3
In-Reply-To: <98ug4fxqji.ln2@ID-313208.user.individual.net>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
 <20180816134120.4b35381b@windsurf>
 <98ug4fxqji.ln2@ID-313208.user.individual.net>
Message-ID: <20180816220442.1e083729@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Aug 2018 21:00:57 +0200, Bernd Kuhls wrote:

> yes, I noticed the bump when I received the new packages from deb-
> multimedia.org, but upstream did until now not provide a tarball, both 
> sites still show 3.0.3 at the time of writing:
> 
> https://www.videolan.org/vlc/download-sources.html
> https://get.videolan.org/vlc/
> 
> Of course we can switch to a git download but I would like to wait until 
> a tarball is provided, ok?

Yes, waiting for a tarball to become available definitely sounds like
the right thing to do.

> Regarding git-formatted patches I will try to remember them but this will 
> add an extra workload for me, yvmv.

It may be a little bit of extra workload initially, but once you will
get used to it, I'm pretty sure you'll realize that you will save some
time.

> May I ask to add this requirement to
> http://buildroot.uclibc.org/downloads/manual/
> manual.html#_providing_patches so new users also get to know this?

True. Can you send a patch ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
