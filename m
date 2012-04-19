From: Ron Eggler <reggler@semiosbio.com>
Date: Thu, 19 Apr 2012 10:13:48 -0700
Subject: [Buildroot] libusb-0.1.12
In-Reply-To: <op.wc0jpyoq705kjs@rico>
References: <op.wcyu5ek6705kjs@rico> <op.wc0jpyoq705kjs@rico>
Message-ID: <4417289.Oi5fZHR2oB@desktop-reg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi There,

I'm trying to assemble and compile a buildroot environment with libusb-0.1.12.
On the build root server I find this file:
http://sources.buildroot.net/libusb_0.1.12.orig.tar.gz
but if I insert 0.1.12 and replace tar.bz2 with tar.gz in my 
package/libusb/libusb.mk, on compilation the script keeps trying to download
http://sources.buildroot.net//libusb-0.1.12.orig.tar.gz
and apparently fails. I seem not to be able to find where that double slash 
behind the domain is coming from.
I'm a newbie with buildrootr and this really is my first time trying it out. 
Some assistance would be appreciated.

Thank you very much!
Ron
-- 
Ron Eggler
Senior Systems Engineer

SemiosBIO
Discovery Parks Vancouver
887 Great Northern Way
Vancouver, BC
V5T 1E2
cell: 778 230 9442
www.semiosbio.com
reggler at semiosbio.com
