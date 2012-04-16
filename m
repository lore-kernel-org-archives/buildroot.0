From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Apr 2012 13:00:34 -0300
Subject: [Buildroot] util-linux builds and installs lots of unwanted
 binaries
In-Reply-To: <1334589472.13607.15.camel@sven>
References: <1334589472.13607.15.camel@sven>
Message-ID: <51a409d383cc64319b438fc9b37c8807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-16 12:17, Sven Neumann wrote:

> Hi,
>
> recently udev started to depend on util-linux for libblkid. Since 
> then
> there are lots of binaries built and installs that did not asked for.
> Here's an incomplete list of such binaries:
>
> blockdev, fdformat, fsck.minix, isosize, mkfs, mkfs.bfs, mkfs.minix,
> mkswap, swaplabel, sfdisk, getopt, getopt-parse.bash, 
> getopt-parse.tcsh,
> cal logger look mcookie namei whereis
>
> Now I am wondering about the best way to change this so that only the
> libraries are built and installed unless util-linux is configured
> otherwise. I am looking for a solution that can be accepted in 
> buildbot.
> And if changes to util-linux are needed, then those should have a 
> chance
> to be accepted upstream in util-linux. What would you advice?
>
>
> Regards,
> Sven

http://lists.busybox.net/pipermail/buildroot/2011-October/046854.html
Regards.
