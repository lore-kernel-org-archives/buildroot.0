From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 08:54:59 +0100
Subject: [Buildroot] [PATCH] triggerhappy: new package
In-Reply-To: <87d27ps4db.fsf@dell.be.48ers.dk>
References: <1418079328-15550-1-git-send-email-peter@korsgaard.com>
 <20141212000823.72d27f28@free-electrons.com>
 <87d27ps4db.fsf@dell.be.48ers.dk>
Message-ID: <20141212085459.73f16901@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 12 Dec 2014 08:40:16 +0100, Peter Korsgaard wrote:

> I believe I just copied the init script from the upmpdcli package, so we
> do have a few init scripts using do_start/do_stop:
> 
> git grep -l do_s package/**/S*
> package/rpi-userland/S94vcfiled
> package/transmission/S92transmission
> package/upmpdcli/S99upmpdcli
> 
> So I'll fix those up for consistency. Thanks!

Yes, we do have a few using do_start/do_stop, but I did a quick poll:
there were 3 or 4 using do_start/do_end, and dozens using start/stop.
So the trend was pretty clear.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
