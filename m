From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 22:02:08 +0100
Subject: [Buildroot] [PATCH v1] qt5base: fix VNC platform plugin build
	on big-endian machines
In-Reply-To: <20170228205554.14805-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 28 Feb 2017 21:55:54 +0100")
References: <20170228205554.14805-1-ps.report@gmx.net>
Message-ID: <8760juhvvz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1], [2]:
 >   In file included from qvncintegration.cpp:38:0:
 >   qvncscreen.h:76:22: error: expected ';' at end of member declaration
 >        bool swapBytes() const

 > [1] http://autobuild.buildroot.net/results/718/7180ad7d7e78f1c3ce6a1f83a5a8fcc5e0ac03a2
 > [2] http://autobuild.buildroot.net/results/14f/14f8c436b184192681fb79c7f0c0d0daa35f867b

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
