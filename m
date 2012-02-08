From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Feb 2012 23:15:07 +0100
Subject: [Buildroot] Ext4 rootfs option
In-Reply-To: <201202082310.49254.arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 8 Feb 2012 23:10:48 +0100")
References: <4F3220B8.9040604@renta.net> <20120208222445.0dc487d7@skate>
 <201202082310.49254.arnout@mind.be>
Message-ID: <878vkd3rbo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  I currently use genext2fs, followed by tune2fs to add the
 Arnout> journal and e2fsck to fix the incorrect FS version number.  But
 Arnout> it's extremely inefficient, especially since genext2fs first
 Arnout> builds the filesystem in memory before committing to the output
 Arnout> image.  Not good when you want to create a 500GB partition :-)

Wow, you're using Buildroot for systems with 500GB rootfs? Must be those
binary video codecs / GPU drivers you were talking about ;)

-- 
Bye, Peter Korsgaard
