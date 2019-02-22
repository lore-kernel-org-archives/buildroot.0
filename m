From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 12:45:17 +0100
Subject: [Buildroot] [PATCH v2] package/qt5/qt5base: handle
 sse2/sse3/ssse3/sse4.1/sse4.2/avx/avx2 configuration
In-Reply-To: <20190205214122.25115-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 5 Feb 2019 22:41:22 +0100")
References: <20190205214122.25115-1-ps.report@gmx.net>
Message-ID: <874l8wm4he.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The Qt configure auto detection (and announced runtime detection
 > feature) failes (see e.g. [1]), so override the configuration
 > with the buildroot determined settings.

 > [1] http://lists.busybox.net/pipermail/buildroot/2019-January/241862.html

 > Reported-by: David Picard <dplamp@gmx.com>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - use 'else ifeq' (suggested by Thomas Petazzoni)
 >   - fix typo (anounced vs. announced)
 >   - clarify no-avx512 comment

 > Notes:
 >  - suggested by Arnout Vandecappelle [2]

 > [2] http://lists.busybox.net/pipermail/buildroot/2019-January/242030.html

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
