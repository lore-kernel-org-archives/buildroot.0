From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 17 Apr 2018 23:44:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-16
In-Reply-To: <20180417060015.58DE620861@mail.bootlin.com>
References: <20180417060015.58DE620861@mail.bootlin.com>
Message-ID: <29a18e12-ff79-f7b1-b077-b28ffae3d1bd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 17/04/2018 ? 08:00, Thomas Petazzoni a ?crit?:
> Hello,
> 

> Detail of failures
> ------------------

>     mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/0531233c289954375438632df15da85bd3bf51c0 |     
>      sparc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/81ab26cb3fa90258f1d2e42f5298d4309ff00c34 |     

This is a host cmake version issue.
My autobuilder is using the latest version:

$ cmake --version
cmake version 3.11.0

The behaviors seems to have changed for some reason, can you have a look?

Best regards,
Romain
