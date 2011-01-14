From: Jon Ambrose <jonathan.ambrose@live.uwe.ac.uk>
Date: Fri, 14 Jan 2011 11:39:59 +0000
Subject: [Buildroot] FW: Festival on Buildroot
Message-ID: <SNT105-DS201489E837B90D9C737910EBF30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

 

Would there be any chance of adding in esd? / How can I go about adding it
if it's not possible?

 

Thanks,

 

Jon

 

Hello,

 

On Thu, 13 Jan 2011 18:55:08 +0000

Jon Ambrose <jonathan.ambrose@live.uwe.ac.uk> wrote:

 

> I am trying to get festival compiled by Buildroot, but having no luck

> what so ever. Has anyone got this running?

> 

> I keep on getting errors complaining about linking

> to ../lib/libestools.so libestbase.so "cannot find -lesd"

 

Well, obviously,  libesd wasn't compiled before festival. And it seems

we don't even have a package for it in Buildroot. So it looks like a

package needs to be created to build the ESD library.

 

It's a bit odd though, since I remember building festival maybe about a

year ago, and I think it was a least building. But from a quick look,

it really seems to depend on esd.

 

Regards,

 

Thomas

-- 

Thomas Petazzoni, Free Electrons

Kernel, drivers, real-time and embedded Linux

development, consulting, training and support.

http://free-electrons.com

 

 

From: Jon Ambrose [mailto:jonathan.ambrose at live.uwe.ac.uk] 
Sent: 13 January 2011 18:55
To: 'buildroot at busybox.net'
Subject: Festival on Buildroot

 

Hi,

 

I am trying to get festival compiled by Buildroot, but having no luck what
so ever. Has anyone got this running?

 

I keep on getting errors complaining about linking to ../lib/libestools.so
libestbase.so "cannot find -lesd"

 

I would really appreciate some help on this one, I have been browsing the
web continuously, and recompiling different options.

 

Best regards,

 

Jon 

 

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110114/60ce2430/attachment.html>
