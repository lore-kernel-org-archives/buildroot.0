From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jun 2016 15:06:41 +0200
Subject: [Buildroot] [PATCH] m68k: gcc coldfire does not provide _sync
	atomics
In-Reply-To: <20160613060303.GA7896@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Mon, 13 Jun 2016 08:03:03 +0200")
References: <20160613060303.GA7896@waldemar-brodkorb.de>
Message-ID: <87inwurdb2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Trying to use __sync_fetch_and_add ends with a gcc ICE.
 > This fixes following autobuild failure, by actually disabling
 > the package for coldfire:
 > http://autobuild.buildroot.net/results/d719db11210d42501332586b4485ab0cc1e125dd/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
