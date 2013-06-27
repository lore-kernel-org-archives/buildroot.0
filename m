From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jun 2013 14:25:55 +0200
Subject: [Buildroot] using a variable within a buildroot menuconfig
In-Reply-To: <51C9D5C5.4090409@mind.be> (Arnout Vandecappelle's message of
 "Tue, 25 Jun 2013 19:39:17 +0200")
References: <51C94D88.5080707@gmail.com> <51C9D5C5.4090409@mind.be>
Message-ID: <87txkj3fl8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I know that it is not very nice way, but I need to integrate buildroot
 >> with Texas Instruments SDK, which is not very GNU build tools friendy.

 Arnout>  I wonder what you mean with the TI SDK. You probably mean you have to
 Arnout> use _some packages_ that are in the 700MB self-extractor, right?
 Arnout> Because the SDK itself is in fact a replacement for buildroot (or
 Arnout> buildroot is a replacement for the SDK, depending on how you want to
 Arnout> look at it :-).

 Arnout>  Getting that stuff to work is absolute horror, I can testify. I did
 Arnout> that a year and a half ago for the DM365 multimedia codecs, but I
 Arnout> never found a reasonable solution to extract and build individual
 Arnout> packages.

FYI, I'm currently looking at more-or-less the same horror, E.G. the
1.6G ezsdk blob for ti81xx.

-- 
Bye, Peter Korsgaard
