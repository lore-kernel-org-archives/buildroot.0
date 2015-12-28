From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 23:00:58 +0100
Subject: [Buildroot] [PATCH v3 1/2] assimp: new package
In-Reply-To: <1450390699-10377-1-git-send-email-ps.report@gmx.net>
References: <1450390699-10377-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151228230058.14ef3c29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, 17 Dec 2015 23:18:18 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> Changes v1 -> v2:
>   - use github helper (thanks to J?rg Krause)
> 
> Changes v2 -> v3:
>   - add c++ dependency (suggested by Thomas Petazzoni)
>   - fix linking problem with builtin zlib (linking code
>     with/without '-fpic' compiled, see e.g. [2]), workaround by selecting
>     buildroot zlib package (failure detected by Thomas Petazzoni [2])
> 
> [1] https://cmake.org/pipermail/cmake/2006-March/008482.html
> [2] http://lists.busybox.net/pipermail/buildroot/2015-December/146859.html

Thanks, I've applied. This time, I didn't do another test build, so I'm
leaving it to the autobuilders to test your package. Please monitor
autobuild.buildroot.org for any failure related to your package in the
coming hours/days.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
