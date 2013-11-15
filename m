From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Nov 2013 09:47:33 +0100
Subject: [Buildroot] [PATCH] wvstreams: remove tcl dependency support
In-Reply-To: <20131114225758.GA13765@gmail.com>
References: <20131114225758.GA13765@gmail.com>
Message-ID: <20131115094733.52d95cbb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andrew Ruder,

On Thu, 14 Nov 2013 16:57:58 -0600, Andrew Ruder wrote:
> As far as I can tell enabling tcl support has no affect on the actual
> library.  Furthermore, wvstreams has been checking for/linking against
> tcl 8.3 which has never been supported in buildroot as far as I can tell
> (8.4 added in 2005).  That being said there is clearly no reason to keep
> this around.

Let's Cc Simon Dawson on this one, he is the one who added wvstreams in
the first place, earlier this year. Maybe he can comment on the TCL
side of it.

>  On a side-note, I am testing a few bigger patches to get expect 5.45
>  and tcl 8.6.1 added/bumped.  I haven't done a decent amount of testing,
>  but figured I'd get some of the smaller patches out of the way as I go.

Great!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
