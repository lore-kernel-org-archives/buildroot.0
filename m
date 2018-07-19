From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 20:10:56 +0200
Subject: [Buildroot] [git commit] linux: automatically set
 CONFIG_PERF_EVENTS when perf is enabled
In-Reply-To: <20180704194852.113E48680E@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 4 Jul 2018 21:52:11 +0200")
References: <20180704194852.113E48680E@busybox.osuosl.org>
Message-ID: <87601bcczz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=63d76c6f2f04c836af24098e26f2befe1e8e4cc4
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Perf profiling cannot be used if CONFIG_PERF_EVENTS is not enabled in the
 > kernel configuration. Similar to other tools, like ktap, we can enable the
 > right options automatically.

 > Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
