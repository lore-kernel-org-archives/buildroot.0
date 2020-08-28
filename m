From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:54:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/elixir: fix host-erlang
 dependency
In-Reply-To: <20200820103034.11094-1-frank.vanbever@essensium.com> (Frank
 Vanbever's message of "Thu, 20 Aug 2020 12:30:34 +0200")
References: <20200820103034.11094-1-frank.vanbever@essensium.com>
Message-ID: <87pn7ar9sf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Vanbever <frank.vanbever@essensium.com> writes:

 > Make it explicit that host-elixir depends on host-erlang. This fixes the
 > build in cases where BR2_PER_PACKAGE_DIRECTORIES is set.

 > Fixes:
 > - http://autobuild.buildroot.net/results/a3a37eb724ca5689f8e83c9b2af04d07afa80315/

 > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
