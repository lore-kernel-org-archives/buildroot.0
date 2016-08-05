From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 09:32:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: Fix compilation when
 __uClinux__ is defined
In-Reply-To: <fee7b830-1e54-5735-082e-05d3b0bc5a87@gmail.com>
References: <1469954504-31016-1-git-send-email-bernd.kuhls@t-online.de>
 <D26F367F-EE90-4A2D-8603-7EBE04E9E2BD@gmail.com>
 <20160804225318.34de32a3@free-electrons.com>
 <fee7b830-1e54-5735-082e-05d3b0bc5a87@gmail.com>
Message-ID: <20160805093229.63547f22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Aug 2016 21:05:10 -0700, Khem Raj wrote:

> For life of me I can not find out, so most probably, its some SOC devkit
> so its fine to ignore this.

I also Google'd for this header, and can't seem to find it anywhere, so
it really seems like some very BSP-specific thingy that was added, and
there's no reason to keep carrying I believe.

I just checked, this include has been here in the Git repository since
the initial code base import, so there's no way to know more precisely
why it was added.

Bernd, could you submit the patch removing this header file to the
upstream project?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
