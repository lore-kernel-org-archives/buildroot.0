From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 13 Jun 2008 16:25:09 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
In-Reply-To: <20080613055326.B817D3C7CA@busybox.net>
References: <20080613055326.B817D3C7CA@busybox.net>
Message-ID: <20080613062509.GA27054@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 12, 2008 at 10:53:26PM -0700, hamish at uclibc.org wrote:
> Author: hamish
> Date: 2008-06-12 22:53:25 -0700 (Thu, 12 Jun 2008)
> New Revision: 22311
> 
> Log:
> Fix missing libtool when building libusb
> 
> 
> Modified:
>    trunk/buildroot/package/libusb/libusb.mk

And now we're back to the original problem where libusb gets built over
and over again. Oh how I love autotools & our autotools packages..

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
