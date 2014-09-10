From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Sep 2014 10:46:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-09
In-Reply-To: <20140910101824.1aae716f@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 10 Sep 2014 10:18:24 +0200")
References: <20140910063013.732CF1018B1@stock.ovh.net>
 <87vbovewb3.fsf@dell.be.48ers.dk>
 <20140910101824.1aae716f@free-electrons.com>
Message-ID: <87mwa7eud3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Wed, 10 Sep 2014 10:04:00 +0200, Peter Korsgaard wrote:
 >> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
 >> 
 >> > Build statistics for 2014-09-09
 >> > ===============================
 >> 
 >> >         success : 264
 >> >        failures : 45 
 >> >        timeouts : 4  
 >> >           TOTAL : 313
 >> 
 >> Wee!
 >> 
 >> I now have autobuild-run running on gcc10, gcc16 and gcc20.

 > Great! So the only one left is gcc110, right?

Yes. I also played with gcc14, but that one is so old that I need to
apply Thomas' rhel5 patches first.

 > Also, how many instances are you running on each machine?

currently I'm using:

ninstances = 3
njobs = 4

On all 3 machines, but I might tweak that a bit.


 > Thanks for getting this done, it's nice to see we jumped from ~100
 > builds a few weeks ago to ~300 builds now. I expect the number of
 > builds per day to reduce a little bit as we fix issues (successful
 > builds are statistically longer than failed builds!), but still we
 > should be in the 250-300 builds/day range.

Yeah, sorry it took so long.


 > I think it's time for me to throw in a few more configurations in
 > there :-)

;)

-- 
Bye, Peter Korsgaard
