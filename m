From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Jan 2016 13:15:34 +0100
Subject: [Buildroot] Error when running make linux-menuconfig
In-Reply-To: <CABi8WTz-HBpF2=Wb1sUDCtFgPhT8vkap14jdezK0zsbQg6660g@mail.gmail.com>
References: <CABi8WTzGpkv+g-cX=w9AXEOu4bz3901q9HPdKYfuMyMvH6B1ug@mail.gmail.com>
 <56A551E8.80900@mind.be>
 <CABi8WTz-HBpF2=Wb1sUDCtFgPhT8vkap14jdezK0zsbQg6660g@mail.gmail.com>
Message-ID: <56A611E6.7040304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Please keep the list in Cc]

On 25-01-16 03:38, FrAnKenStEiN MC wrote:
> please what is the different between linux-menuconfig and menuconfig ... i'm
> just new to buildroot 

 menuconfig is to configure buildroot, e.g. to select packages to install in
your rootfs.

 linux-menuconfig is to configure the Linux kernel, e.g. to select which drivers
to compile.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
