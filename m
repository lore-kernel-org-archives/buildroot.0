From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Aug 2018 21:00:57 +0200
Subject: [Buildroot] [PATCH/next v2 00/23] package/vlc: bump version to
 3.0.3
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
 <20180816134120.4b35381b@windsurf>
Message-ID: <98ug4fxqji.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 16 Aug 2018 13:41:20 +0200 schrieb Thomas Petazzoni:

> Another comment: there is a 3.0.4 tag, and there are quite a few fixes
> between 3.0.3 and 3.0.4, including the Qt5 build fix. Perhaps you could
> bump to 3.0.4 ?

Hi Thomas,

yes, I noticed the bump when I received the new packages from deb-
multimedia.org, but upstream did until now not provide a tarball, both 
sites still show 3.0.3 at the time of writing:

https://www.videolan.org/vlc/download-sources.html
https://get.videolan.org/vlc/

Of course we can switch to a git download but I would like to wait until 
a tarball is provided, ok?

Regarding git-formatted patches I will try to remember them but this will 
add an extra workload for me, yvmv. May I ask to add this requirement to 
http://buildroot.uclibc.org/downloads/manual/
manual.html#_providing_patches so new users also get to know this?

Regards, Bernd
