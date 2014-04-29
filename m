From: Dan Moulding <dan.moulding@rackwareinc.com>
Date: Tue, 29 Apr 2014 13:18:51 -0600 (MDT)
Subject: [Buildroot] [PATCH] Create /dev/null device node when building
	a cpio rootfs
In-Reply-To: <535FF178.2090507@mind.be>
References: <1398784378-20251-1-git-send-email-dan.moulding@rackwareinc.com> 
 <1398784378-20251-2-git-send-email-dan.moulding@rackwareinc.com> 
 <535FF178.2090507@mind.be>
Message-ID: <1398799131.565731726@apps.rackspace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, April 29, 2014 12:37pm, "Arnout Vandecappelle" <arnout@mind.be> said:

> 
>  How is this issue limited to the cpio rootfs? You'll have the same issue
> with any rootfs, right?

Absolutely. But it was only making /dev/console for cpio... so I decided to follow suit, thinking maybe there was a good reason for it.

> 
>  So perhaps a better solution is to move /dev/console and /dev/null from
> device_table_dev.txt to device_table.txt.
> 

Agreed.

>  IOW this approach was suggested before but not really picked up.
>

Yes. And in fact, I had stumbled upon these past discussions when Googling about this. I just wasn't sure why it never got picked up.
 
Cheers,

-- Dan
