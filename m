From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 23:01:19 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: bumped version number to 5.25
In-Reply-To: <trinity-621b72dd-4362-44df-bbf8-d19c6ffb5953-1416701559591@3capp-gmx-bs13>
References: <trinity-621b72dd-4362-44df-bbf8-d19c6ffb5953-1416701559591@3capp-gmx-bs13>
Message-ID: <20141126230119.75fb213d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sun, 23 Nov 2014 01:12:39 +0100, Peter Seiderer wrote:

> > Just a few more things for the next time you send patches to Buildroot.
> > After sending a new version of a patch, we usually mark the former patch
> > as "superseded" in patchwork. To be able to do that, you need to be
> > logged in in patchwork. If you don't have an account, you can create one
> > here:
> > 
> > http://patchwork.ozlabs.org/register/
> > 
> 
> Would be a nice patchwork feature to mark 'legacy' patches automatically
> as superseded in case a newer patch (with same subject, new version number,
> from same submitter) is detected on the mailing list?

There is a such a feature, but only if the new version of the patch
series is sent as a reply to the previous one. And of course, it only
works if each patch in the new version have exactly the same subject as
in the previous version. That's why we never use it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
