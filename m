From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 5 Oct 2006 19:50:14 +0200
Subject: [Buildroot] LZMA in Buldroot.
In-Reply-To: <200610051340.06276.rob@landley.net>
References: <20061003173002.GA19937@zelow.no> <20061004163742.GA2306@zelow.no>
	<20061004192606.GO17455@aon.at>
	<200610051340.06276.rob@landley.net>
Message-ID: <20061005175014.GA32372@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 05, 2006 at 01:40:06PM -0400, Rob Landley wrote:
>On Wednesday 04 October 2006 3:26 pm, Bernhard Fischer wrote:
>> Yes, i left it commented out. I had (and still have) trouble with c++
>> due to an alleged bug with libtool on my ubuntu devel host. Probably i'll
>> ditch that install and go back to what i usually run as a sensible base
>> to work on.
>
><rant>
>
>It took me a while to figure out what libtool was for, but one of my coworkers 
>explained that the purpose of the thing is to make sure that shared libraries 
>work as well on Sun and AIX and Hurd and such as they do on Linux.
>
>You'd think that they'd do this by improving library support on other 
>platforms rather than breaking Linux's shared library support (at least if 
>you use libtool) until the other platforms don't look so bad in comparison.  
>But that's not the FSF way.  In the land of the blind, the one-eyed must have 
>that eye poked out in the name of fairness and equality.
>
>There is absolutely no reason to use libtool on Linux, and it regularly breaks 
>when you're cross-compiling from Linux to Linux on different processors.

Just to clarify, i'm talking about the gcc internal copy of libtool that
seems to misbehave for me. I'm _not_ using libtool to create a library
for use in buildroot.
>
></rant>
