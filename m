From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 18 Dec 2013 04:14:54 -0600
Subject: [Buildroot] [PATCH v5 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <CAAXf6LUygcB8Zn6Pq+0og6xCeo5_UkkLUPY6ziGXNtMKOVyR0w@mail.gmail.com>
References: <1387291730-6513-1-git-send-email-rjbarnet@rockwellcollins.com>	<1387291730-6513-2-git-send-email-rjbarnet@rockwellcollins.com>
 <CAAXf6LUygcB8Zn6Pq+0og6xCeo5_UkkLUPY6ziGXNtMKOVyR0w@mail.gmail.com>
Message-ID: <OF893FB68F.95FBB8DB-ON86257C45.0038131E-86257C45.0038464F@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas D,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 12/18/2013 
03:47:25 AM:

> Hi Ryan,
> 
> On Tue, Dec 17, 2013 at 3:48 PM, Ryan Barnett
> <rjbarnet@rockwellcollins.com> wrote:
> [..]
> 
> > +The exception to +BR2_GLOBAL_PATCH_DIR+ being the preferred method 
for
> > +specifying custom patches is +BR2_LINUX_KERNEL_PATCH+.
> > ++BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches 
that
> > +are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCHES+ are 
applied
> > +after patches available in +BR2_GLOBAL_PATCH_DIR+ as it is a patch
> > +post-hook step for the Linux package.
> 
> In v4 I had following comment on this sentence:
> -----
> 'a patch post-hook step for the Linux package' sounds odd.
> What about:
> ..., as it is done from a post-patch hook of the Linux package.
> -----
> 
> Of course, you don't have to agree on this, but as I did not see any
> response on it I think it may have simply been overlooked.

You are correct, with the flood of email traffic yesterday on this I 
accidentally missed this change as I prefer you wording over mine. I will 
submit v6 of this patch with this change.

Thanks,
-Ryan
