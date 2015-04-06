From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:22:24 +0200
Subject: [Buildroot] [PATCH 0/2] Change the name of variable <PKG>_MAJOR
 to <PKG>_VERSION_MAJOR
In-Reply-To: <1425508277-11723-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1425508277-11723-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20150406122224.4d3f341e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Wed,  4 Mar 2015 23:31:15 +0100, Jerzy Grzegorek wrote:
> We usually use a name <PKG>_VERSION_MAJOR so do it for Buildroot consistency.
> 
> Jerzy Grzegorek (2):
>   lockdev: change the name of variable LOCKDEV_MAJOR to
>     LOCKDEV_VERSION_MAJOR
>   swig: change the name of variable SWIG_MAJOR to SWIG_VERSION_MAJOR
> 
>  package/lockdev/lockdev.mk | 8 ++++----
>  package/swig/swig.mk       | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
