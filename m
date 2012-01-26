From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2012 16:38:12 +0100
Subject: [Buildroot] Request for review: buildroot in Open Mobile Linux
 devroom of FOSDEM
In-Reply-To: <201201160950.18702.arnout@mind.be>
References: <201201160950.18702.arnout@mind.be>
Message-ID: <20120126163812.02917ef3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jan 2012 09:50:18 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  As I announced earlier, I'll be giving a talk in the Open Mobile
> Linux devroom on FOSDEM.  I would like to get feedback on the
> slides.  You can find them on http://mind.be/?page=publications
> (in .odp and .pdf).
> 
>  It's a 15 minute talk.  My goal is not to explain how to use
> buildroot, but rather to convince the audience that buildroot (or
> something similar) is the way to go for "open" embedded devices,
> because it empowers the user to make modifications and improvements.
> 
>  My slides aren't really stand-alone, so it may actually be difficult
> to review them without hearing my talk :-(

I did a quick review, and those slides look good. As you say, without
the actual speech, it's hard to see where you want to go. From my point
of view, the very important thing with embedded Linux build systems is
repeatability/reproducibility. I have seen way too many
people/companies building their embedded Linux system by randomly
cross-compiling dozens of libraries manually, without any way of
reproducing that build process.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
