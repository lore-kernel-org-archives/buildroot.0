From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 12:21:16 +0100
Subject: [Buildroot] oprofile "requires" gmp??? Slight fork:
	BR2_STAGING_DIR
In-Reply-To: <20101229115733.55dc9bd2@surf> (Thomas Petazzoni's message of
	"Wed, 29 Dec 2010 11:57:33 +0100")
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com>
	<20101223082740.3a8e44c4@surf>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>
	<20101224090517.0c935c19@surf>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar> <4D18D873.9010502@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
	<4D19E079.9030704@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB2EA@EXV1.corp.adtran.com>
	<4D1A54D6.60805@zacarias.com.ar> <20101229115733.55dc9bd2@surf>
Message-ID: <87lj38keoj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Tue, 28 Dec 2010 18:21:26 -0300
 Thomas> Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

 >> I was about to say that we can keep a symlink from staging->sysroot
 >> but i'd rather watch it die because i can't think of any useful
 >> purpose where people can't use the computed $(STAGING_DIR) directly.

 Thomas> I think we should keep such a symbolic link, at least at the beginning.
 Thomas> It'll allow users to notice that staging/ still exists, but has moved
 Thomas> to another place.

Yes, I think that was also what we concluded at the last BR dev day.

-- 
Bye, Peter Korsgaard
