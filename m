From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 9 Feb 2012 08:02:46 -0600
Subject: [Buildroot] Ext4 rootfs option
In-Reply-To: <878vkd3rbo.fsf@macbook.be.48ers.dk>
References: <4F3220B8.9040604@renta.net> <201202082310.49254.arnout@mind.be>
 <878vkd3rbo.fsf@macbook.be.48ers.dk>
Message-ID: <201202090802.48714.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed February 8 2012, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  Arnout>  I currently use genext2fs, followed by tune2fs to add the
>  Arnout> journal and e2fsck to fix the incorrect FS version number.  But
>  Arnout> it's extremely inefficient, especially since genext2fs first
>  Arnout> builds the filesystem in memory before committing to the output
>  Arnout> image.  Not good when you want to create a 500GB partition :-)
> 
> Wow, you're using Buildroot for systems with 500GB rootfs? Must be those
> binary video codecs / GPU drivers you were talking about ;)
> 

Naw, this is the embedded inventory system for the home refrigerator.
Leaves room for a bit of meal variety week-to-week. ;)

Mike
