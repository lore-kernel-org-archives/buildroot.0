From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 12:12:17 +0100
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: disable JSC JIT for
 MIPSr6
In-Reply-To: <20200211204445.782766-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 11 Feb 2020 22:44:44 +0200")
References: <20200211204445.782766-1-aperez@igalia.com>
Message-ID: <8736ak1kry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Forcibly disable the JavaScriptCore JIT compilation support
 > for MIPSr6 processors, which are unsupported.

 > Fixes: http://autobuild.buildroot.net/results/3d21d3c3460cd85a4c828dd197929cdf17aaf4e0

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
