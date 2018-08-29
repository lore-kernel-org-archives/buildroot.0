From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 Aug 2018 21:51:07 +0200
Subject: [Buildroot] [PATCH next v2] libyaml: fix libyaml-legal-info
 build failure
In-Reply-To: <20180829205712.6e06acc4@windsurf>
References: <87zhx5vxpk.fsf@tkos.co.il>
 <20180829183635.112003-1-giulio.benetti@micronovasrl.com>
 <20180829205712.6e06acc4@windsurf>
Message-ID: <46dfc7a3-dae8-f4a7-4d32-8ef00a10c794@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 29/08/2018 20:57, Thomas Petazzoni ha scritto:
> Applied to next, thanks. An additional thing that would have been nice
> in the commit log is something like this:
> 
> """
> Commit a4633a53ae1592ad2f4ea6f931c061382cf44b7f ("libyaml: bump to
> version 0.2.1") forgot to update the hash of the license file.
> """
> 
> or any other wording that references the commit that introduced the
> problem. It is sometimes useful later on to figure out when a given
> problem was introduced.
> 
> But that wasn't important enough for this one, so I've applied as-is.
> Something to keep in mind for future contributions, though.

Sure I will, thank you.

Giulio Benetti
