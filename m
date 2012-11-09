From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 11:47:50 +0100
Subject: [Buildroot] Autotest infrastructure (a bit of off-topic: git
 repo URL)
In-Reply-To: <509C224B.8000405@mind.be>
References: <509BC913.3080902@mind.be> <509BDBF2.1060700@digi.com>
 <509C224B.8000405@mind.be>
Message-ID: <20121109114750.6a4dc53a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 08 Nov 2012 22:21:15 +0100, Arnout Vandecappelle wrote:
>   Pretty off-topic indeed... but I don't mind :-)
> 
> On 11/08/12 17:21, Javier Viguera wrote:
> > I attended the other day to your talk on "upgrading without bricking" (congrats for that, i learned a lot) and you
> > mentioned a repo where you have started collecting some tools/scripts to do the job.
> >
> > Could you remind me that repo URL? I shouldn't have trust i would remember it some days after.
> 
>   https://gitorious.org/gupies
> 
>   But as I mentioned, it's still pretty empty...  I expect to really start
> committing something in a week or two.
> 
>   I've also created a mailing list, but it's on google groups which sucks
> somewhat: https://groups.google.com/group/gupies/subscribe
> If you have a better idea, I'd welcome that.

On a related topic (firmware upgrade), I have:
https://gitorious.org/embedded-linux-firmware-upgrade-tool/embedded-linux-firmware-upgrade-tool

It has a:

 * A host utility to prepare firmware images composed of multiple parts
   (usually a kernel image + root filesystem image, but there could be
   more)

 * A target utility that can run either on the command line or as a CGI
   script. This utility does the firmware upgrade itself by fiddling
   with the U-Boot environment.

The tool assumes that the flash has two partitions for each component
been upgraded (one active partition, one to upgrade).

The documentation at
https://gitorious.org/embedded-linux-firmware-upgrade-tool/embedded-linux-firmware-upgrade-tool/blobs/master/fwupgrade-doc.txt
has a few details.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
