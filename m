From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 05 Jul 2013 15:39:16 +0200
Subject: [Buildroot] buildroot
In-Reply-To: <51D4A9FB.1070402@lamiaworks.com.au> (scsijon@lamiaworks.com.au's
 message of "Thu, 04 Jul 2013 08:47:23 +1000")
References: <51D4A9FB.1070402@lamiaworks.com.au>
Message-ID: <87fvvtjfcr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "scsijon" == scsijon  <scsijon@lamiaworks.com.au> writes:

Hi,

Please send buildroot questions to the buildroot list instead of
directly to me, thanks.

 scsijon> Any chance that buildroot may have a 'switch' to make the development
 scsijon> files (compiler, header files, etc.) appear in the target.

We used to have that (BR2_HAVE_DEVFILES), but it has been deprecated for
a while and has recently been completely removed.

 scsijon> I want to use it together with Aboriginal and create a total
 scsijon> self contained Cross-compiler Development System and they are
 scsijon> needed for further application and utility compiling.

I don't quite understand how you would combine them. Buildroot is really
about cross compiling everyting, and Aboriginal is just the opposite -
Compiling on (emulated) native hardware. They both more or less solve
the same problem, just in different ways.

-- 
Bye, Peter Korsgaard
