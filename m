From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 00:44:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix build with expat
In-Reply-To: <20200214164036.2901160-1-fontaine.fabrice@gmail.com>
References: <20200214164036.2901160-1-fontaine.fabrice@gmail.com>
Message-ID: <20200220004432.5d237143@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 14 Feb 2020 17:40:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build with expat fails since January 14th (for an unknown reason as
> commit cd16e18584066d2817d3acb3822e173f9f23455e does not seem to be the
> culprit even if this is the more suspicious commit around that time) on:

Thanks a lot for this patch, it was a good starting point to
investigate more, and based on your research, I could dig deeper and
submit what I believe is a more correct solution:

  http://patchwork.ozlabs.org/patch/1241072/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
