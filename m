From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Mar 2014 07:54:25 +0100
Subject: [Buildroot] Old information on
	http://git.buildroot.net/buildroot/
In-Reply-To: <53149B1D.9070507@carallon.com> (Will Wagner's message of "Mon,
 03 Mar 2014 15:09:17 +0000")
References: <5314950B.9040506@carallon.com>
 <20140303090427.4032b712@core2quad.morethan.org>
 <53149B1D.9070507@carallon.com>
Message-ID: <87ioru78ta.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 > On 03/03/2014 15:04, Mike Zick wrote:
 >> On Mon, 03 Mar 2014 14:43:23 +0000
 >> Will Wagner <will_wagner@carallon.com> wrote:
 >> 
 >>> Hello,
 >>> 
 >>> I just noticed that there is very old data on the summary page when
 >>> browsing git, according to the footer it was generated 06/03/2013.
 >>> 
 >> 
 >> Try: http://git.buildroot.net/buildroot
 >> (No trailing '/' in URL.)
 >> 

 > That's great!

 > So I guess the issue is instead that the 'Browse Source' link on the
 > buildroot homepage needs updating to remove the trailing '/'

The problem is that the working/broken links sometimes swap around, so
you either have to add or remove the trailing '/'.

We have reported it to the osuosl.org guys several times, and recently
they have removed the varnish cache in front on cgit, which is what we
thought caused the problems - But that apparently didn't fix it.

I'll followup with the osuosl.org staff and see what else we can try.

-- 
Bye, Peter Korsgaard
