From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 22:32:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] configs: add defconfig for TS-7680
In-Reply-To: <1579641247.257204.1502482178572.JavaMail.zimbra@savoirfairelinux.com>
References: <20170810221411.4324-1-julien.grossholtz@savoirfairelinux.com>
 <20170811153934.5efac50e@windsurf>
 <1579641247.257204.1502482178572.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <20170811223201.1ffeffe6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Aug 2017 16:09:38 -0400 (EDT), Julien Grossholtz wrote:

> >>  board/technologic/ts7680/genimage.cfg              |  14 +
> >>  ...LLVMLinux-use-static-inline-in-ARM-ftrace.patch |  52 +++
> >>  ...ux-Change-extern-inline-to-static-inline-.patch |  59 ++++
> >>  ...c-integrate-the-various-compiler-gcc-345-.patch | 367 +++++++++++++++++++++  
> > 
> > What are the chances of getting these patches merged "upstream" by the
> > board vendor ? It's not really nice if we have to keep these patches
> > forever.  
> 
> I will ask if it is OK for them.

Good, thanks.

> > Why do you select glibc, and leave Buildroot default ?  
> 
> I can switch back to default config, there is no special need for the glibc.

Yes, please leave it to the default (uClibc-ng). Users are of course
free to change to another C library if they want to.

> Thank you for the review! I will send a new version once I know if it is possible to merge the
> Linux patches into the Technologic Systems github repository.

Perfect, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
