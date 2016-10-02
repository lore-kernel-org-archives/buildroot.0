From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Oct 2016 21:53:19 +0200
Subject: [Buildroot] [PATCH] vo-aacenc: disable arm optimizations on
	thumb2-only variants
In-Reply-To: <20161002153723.1135-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 2 Oct 2016 17:37:23 +0200")
References: <20161002153723.1135-1-peter@korsgaard.com>
Message-ID: <87oa32o7dc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.org/results/258/258e14227cdd5a6f5cc83ab7fd176eb5b5b8445a/
 > http://autobuild.buildroot.org/results/634/6345b4c491fca952cd692844e3ac2932ac4836dc/

 > The ARM assembly optimizations in vo-aacenc requires ARM instructions
 > support, so disable for ARM variants without ARM instruction support (E.G.
 > cortex-m).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
