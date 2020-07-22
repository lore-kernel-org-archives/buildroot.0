From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 23:09:26 +0200
Subject: [Buildroot] [2020.02.x] package/pcre: security bump to 8.44
In-Reply-To: <CANQCQpZg+huuOz8hB7OohN=Z2E4bz7xajeebY7JoLP=6GbBHpQ@mail.gmail.com>
 (Matthew Weber's message of "Tue, 14 Jul 2020 15:15:00 -0500")
References: <20200714194008.63423-1-matthew.weber@rockwellcollins.com>
 <20200714220851.3d616930@windsurf.home>
 <CANQCQpZg+huuOz8hB7OohN=Z2E4bz7xajeebY7JoLP=6GbBHpQ@mail.gmail.com>
Message-ID: <87a6zrfe9l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Thomas,
 > On Tue, Jul 14, 2020 at 3:09 PM Thomas Petazzoni
 > <thomas.petazzoni@bootlin.com> wrote:
 >> 
 >> On Tue, 14 Jul 2020 14:40:08 -0500
 >> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
 >> 
 >> >  * 0001-Kill-compatibility-bits.patch had a bugfix for the lcc
 >> >    compiler (https://vcs.pcre.org/pcre/code/trunk/pcrecpp.cc?r1=1735&r2=1752&pathrev=1763)
 >> >  * License file updated copyright date
 >> >
 >> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 >> 
 >> There is already a bump to 8.44 in master. Why do you send a separate
 >> patch doing the same thing, but for 2020.02.x ?
 >> 

 > Agree, not needed.  I realized this afterwards.

 >> I think in this kind of case, we should instead reply to the commit
 >> e-mail, and ask Peter to backport it to 2020.02.x.

 > I just checked and it was old enough that I don't have the original
 > commit email.

 >> 
 >> However, you label it as a security bump, without saying which
 >> vulnerability is being fixed. The original version bump commit did not
 >> label it as a security bump.

 > Agree, should have included:

 > CVE-2020-14155
 > libpcre in PCRE before 8.44 allows an integer overflow via a large
 > number after a (?C substring.

Committed to 2020.02.x with a reference to that CVE, thanks.

-- 
Bye, Peter Korsgaard
