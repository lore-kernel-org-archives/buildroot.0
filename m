From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Nov 2019 23:44:19 +0100
Subject: [Buildroot] [next] package/rng-tools: bump to 6.8
In-Reply-To: <20191116124247.49835-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Sat, 16 Nov 2019 06:42:47 -0600")
References: <20191116124247.49835-1-matthew.weber@rockwellcollins.com>
Message-ID: <87y2wftpa4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Dropped autoreconf and non-standard pthread yield patches as they merged
 > upstream.

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com

..
 
 > -RNG_TOOLS_VERSION = 6.7
 > +RNG_TOOLS_VERSION = 6.8
 >  RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))

You did not actually remove the autoconf. Committed to next with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
