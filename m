From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 22:28:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] core: add option to force compiling
 C++ as C++11
In-Reply-To: <1448893176-21456-1-git-send-email-agalakhov@gmail.com>
References: <1448893176-21456-1-git-send-email-agalakhov@gmail.com>
Message-ID: <20160415222853.47551832@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Nov 2015 15:19:36 +0100, Alexey Galakhov wrote:
> Many C++ libraries like boost and log4cplus use defines to be compatible with
> both C++03 and C++11 standards. This causes ABI incompatibilities between
> a library built with C++03 and an application built with C++11. To avoid this,
> one has to built libraries as C++11 as well.
> 
> This patch introduces the BR2_ENABLE_CPP11 configuration option that forces
> passing --std=c++11 to the compiler while building C++ target libraries.
> 
> Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>

Following the feedback from Arnout, I've marked this patch as Rejected
in our patch tracking system. The issue should be solved on a
per-package basis.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
