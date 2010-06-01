From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jun 2010 22:10:19 +0200
Subject: [Buildroot] [git commit master] Revert "Add -rpath option for
	host package compilation"
In-Reply-To: <20100601211839.4b8e06b2@surf> (Thomas Petazzoni's message of
	"Tue, 1 Jun 2010 21:18:39 +0200")
References: <20100530084318.C8A0EC03A6@busybox.osuosl.org>
	<20100601195204.6353fe94@surf> <87pr0ar3np.fsf@macbook.be.48ers.dk>
	<20100601211839.4b8e06b2@surf>
Message-ID: <87ljayqztg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I wouldn't exactly call it pretty, but if we don't have any other
 >> options ..

 Thomas> I don't find this pretty either, but what other options do you see ?

None :/ So I would say, go for it.

 Thomas> I'm ready to try other approaches.

Lets try this approach, we can always move to a cleaner approach later
if we find one. In the mean time the build is fixed for those
situations.

-- 
Bye, Peter Korsgaard
