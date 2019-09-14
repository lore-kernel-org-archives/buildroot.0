From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Sep 2019 15:42:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-13
In-Reply-To: <20190914105828.GA10015@curiosity>
References: <20190914061259.9228385CA8@hemlock.osuosl.org>
 <20190914105828.GA10015@curiosity>
Message-ID: <20190914154226.18aabc3b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

On Sat, 14 Sep 2019 13:58:28 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> It looks like almost all the defconfig builds failed due to the issue
> with CI infrastructure:
> 
> ERROR: Job failed (system failure): Error response from daemon:
> mkdir /home/docker/aufs/mnt/56f5a829e13290f603b956812782ffb352b2d178969fa60b68cedd67ab2ec79d-init: no space left on device (executor_docker.go:743:0s)

Thanks for noticing and reporting the issue. There was indeed a disk
space issue on Bootlin's server. I have cleaned up some disk space, and
I've restarted a Gitlab CI pipeline. We should have the results in
tomorrow's daily e-mail.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
