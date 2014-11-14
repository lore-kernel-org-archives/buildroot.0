From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 14 Nov 2014 19:26:09 +0100
Subject: [Buildroot] [PATCH v2 3/4] evemu: bump version to 2.1.0
Message-ID: <trinity-888df320-8e8f-41aa-a55a-0fa45798dbbd-1415989568463@3capp-gmx-bs29>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente,

On Fri, Nov 14, 2014 at 02:28:53PM +0000, Vicente Olivert Riera wrote:
> Dear Peter Seiderer,
> 
> I suggest you to do this:
> 
> EVEMU_SITE = http://www.freedesktop.org/software/evemu
> EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
> 
> That way it will download the evemu-2.1.0.tar.xz tarball and your hash
> file will make sense.
> 
> Right now it downloads a evemu-2.1.0.tar.gz from
> http://cgit.freedesktop.org/evemu/snapshot/evemu-2.1.0.tar.gz and your
> has file is useless:
> 
> $ make
> WARNING: No hash found for
> /home/ldap/vriera/work/mips-buildroots/mips64/dl/evemu-2.1.0.tar.gz
> 

Sorry for the mess, believed buildroot will fail on a wrong hash value and not only
give a warning....

Will spin a new version of the patchset with your suggested changes...

Regards,
Peter

> Best regards,
> -- 
> Vicente Olivert Riera
> Graduate Software Engineer, MIPS Processor IP
> Imagination Technologies Limited
> t: +44 (0)113 2429814
> www.imgtec.com
> 
