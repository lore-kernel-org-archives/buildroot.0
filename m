From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Sep 2015 15:03:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-09-07
In-Reply-To: <20150908063019.593E81015AE@stock.ovh.net>
References: <20150908063019.593E81015AE@stock.ovh.net>
Message-ID: <55EEEACA.6020202@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/08/2015 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2015-09-07

>     mips64el |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/1196ac448c77320b59b63b6133d2d1af1245bf69/

This is a race condition and I have reported it upstream:

  https://github.com/TresysTechnology/setools3/issues/5

Should we build setools with -j1 until upstream fixes the problem?

Regards,

Vincent.
