From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 20 Jun 2013 09:10:05 +0200
Subject: [Buildroot] [PATCH] usbmount: stop using blkid,
 use udev environment variables instead
In-Reply-To: <87r4fxq1sy.fsf@dell.be.48ers.dk>
References: <20130619164656.33bc3f8c@skate>
 <1371657388-11563-1-git-send-email-s.neumann@raumfeld.com>
 <87r4fxq1sy.fsf@dell.be.48ers.dk>
Message-ID: <1371712205.2776.18.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,
On Wed, 2013-06-19 at 22:32 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> The blkid binary is not any longer installed when libblkid from
>  Sven> util-linux is selected. udev has a builtin blkid command though
>  Sven> and already detects all values that we are interested in. Change
>  Sven> the usbmount script to use the environment variables set by udev
>  Sven> instead of calling blkid directly.
> 
>  Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> 
> Committed, thanks. Please don't forget to send the patch upstream as
> well.

Well, I can try, but I am afraid that usbmount is not any longer
maintained. The project page doesn't indicate any activity for year and
the last commits in their SVN repository date back to 2009 (after the
package has been officially orphaned in 2007).


Regards,
Sven
