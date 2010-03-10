From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 10 Mar 2010 10:50:56 -0600
Subject: [Buildroot] [PATCH] remove -mm linux patch options
In-Reply-To: <87sk881e33.fsf@macbook.be.48ers.dk>
References: <0D753D10438DA54287A00B027084269763682CDACA@AUSP01VMBX24.collaborationhost.net>
	<87sk881e33.fsf@macbook.be.48ers.dk>
Message-ID: <0D753D10438DA54287A00B027084269763683A7147@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, March 10, 2010 6:50 AM, Peter Korsgaard wrote:
>>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:
>
> H> The -mm tree is really no longer available since the -next tree 
> H> was created for testing.  It's not even listed on the kernel.org
> H> site any longer.  Plus, the last one that was published as
> H> available was pretty old, 2.6.28-rc2-mm1.
>
> H> Remove all the -mm patch stuff from Buildroot to clean up the
> H> Linux kernel selection.
>
> Committed, thanks.

Thanks.

I have a follow-up patch to remove the config options from the various
defconfig's if you want it.  Or are they handled a different way?

Regards,
Hartley
