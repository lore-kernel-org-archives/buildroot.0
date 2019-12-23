From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 10:06:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-subprocess32: add
 PYTHON_SUBPROCESS32_CONFIGURE_CMDS
In-Reply-To: <20191214171023.1650001-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Dec 2019 18:10:23 +0100")
References: <20191214171023.1650001-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv5rv2bb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since commit 1745fcde740057951dcc5429f3bfabd103b764a1,
 > python-subprocess32 fails to build because it runs configure with
 > incorrect arguments so add a PYTHON_SUBPROCESS32_CONFIGURE_CMDS

 > Fixes:
 >  - http://autobuild.buildroot.org/results/dcf944129392ee6cacc106e096d8d3adfa4447bb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
