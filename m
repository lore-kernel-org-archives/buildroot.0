From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 11:01:22 +1300
Subject: [Buildroot] [PATCH 1/1] ucl: Use -std=iso9899:1990 instead of
 -std=c90
In-Reply-To: <20170125192020.27140-1-stilor@att.net>
References: <20170125192020.27140-1-stilor@att.net>
Message-ID: <20170126110122.1f420135@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jan 2017 11:20:20 -0800, Alexey Neyman wrote:
> The shorter alias, -std=c90, is not known by older versions of GCC.
> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=20631.
> 
> Signed-off-by: Alexey Neyman <stilor@att.net>

Thanks for the patch. Is this fixing a specific autobuilder issue? In
which situation have you seen the failure?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
