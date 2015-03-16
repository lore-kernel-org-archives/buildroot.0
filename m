From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 Mar 2015 20:48:27 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-03-15
Message-ID: <trinity-6176f6c4-f632-4e4e-a465-303560016dab-1426535307608@3capp-gmx-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, Mar 16, 2015 at 08:30:20AM +0100, Thomas Petazzoni wrote:
> Build statistics for 2015-03-15
> ===============================

[...]

>       x86_64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/2efb5c6c85496fab2591d3a12e81f5020c1e30b3/

   libpq . . . . . . . . no (libpq-fe.h not found)
   postgresql  . . . . . no (dependency error)

configure: error: "Some plugins are missing dependencies - see the summary above for details"
make: *** [/home/peko/autobuild/instance-0/output/build/collectd-5.4.2/.stamp_configured] Error 1
make: Leaving directory `/home/peko/autobuild/instance-0/buildroot'

Should be fixed with https://patchwork.ozlabs.org/patch/448733/

Regards,
Peter
