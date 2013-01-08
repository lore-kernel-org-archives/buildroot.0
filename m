From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 23:29:20 +0100
Subject: [Buildroot] [git commit] pthread-stubs: rename to
 xlib_libpthread-stubs
In-Reply-To: <50EC9186.7050802@mind.be>
References: <20130105124707.668AD9A64B@busybox.osuosl.org>
 <50EC9186.7050802@mind.be>
Message-ID: <20130108232920.6676165c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 08 Jan 2013 22:37:10 +0100, Arnout Vandecappelle wrote:

> - There would be a comment that this is a legacy option from 2011.11;

Ok, so, something like:

#
# Legacy options from 2012.11
#

> - The BR2_LEGACY_CHECK_2012_11 is updated to BR2_LEGACY_CHECK_2013_02 so 
> that it is re-enabled (but this can be done just prior to the release, of 
> course).

I am not sure to fully understand the idea in Config.in.legacy. What
happens if someone upgrades from 2012.08 to 2013.02 (i.e, skips the
2012.11 version) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
