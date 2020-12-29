From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 15:40:25 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-12-27
In-Reply-To: <2e43559b-f163-db99-09c9-83942feb5e81@grinn-global.com>
References: <2e43559b-f163-db99-09c9-83942feb5e81@grinn-global.com>
Message-ID: <20201229154025.723c8a9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Dec 2020 15:36:20 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> >               name              | found by |        link to release-monitoring.org        |   version    |   upstream
> > -------------------------------+----------+----------------------------------------------+--------------+--------------
> >                  python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 2.8          | 3.0  
> https://patchwork.ozlabs.org/project/buildroot/patch/20201109191210.1037530-1-b.bilas at grinn-global.com/
> >    
> >                        qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.1       | 6.0.0
> >                      qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.1       | 6.0.0
> >                            ttyd |  DISTRO  | https://release-monitoring.org/project/13890 | 1.6.1        | 1.6.2  
> ttyd is already bumped into 1.6.2

Yes, this was due to the fact that the report was based on the stale
"next" branch. I've dropped the stale "next" branch, so the report now
properly uses the "master" branch, and you can see at
http://autobuild.buildroot.net/stats/ that it sees ttyd being at 1.6.2,
which is up-to-date.

So you won't receive any notification about ttyd being not update next
Monday. Unless of course 1.6.3 is released in the mean time :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
