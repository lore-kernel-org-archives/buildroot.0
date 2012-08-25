From: Jonathan Liu <net147@gmail.com>
Date: Sat, 25 Aug 2012 18:20:43 +1000
Subject: [Buildroot] [PATCH] syslinux: fix host build with newer Linux
 headers
In-Reply-To: <20120825101947.1479f89c@skate>
References: <1345356100-23521-1-git-send-email-net147@gmail.com>
 <20120825101947.1479f89c@skate>
Message-ID: <50388ADB.4090809@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 25/08/2012 6:19 PM, Thomas Petazzoni wrote:
> Can you be more specific about which versions of the kernel headers 
> are causing problems? I've just built syslinux with a 3.4 kernel 
> headers based Buildroot toolchain, and it worked fine. Thanks! Thomas 

I am using Linux 3.5.1 headers on the host system building host-syslinux.

Regards,
Jonathan
