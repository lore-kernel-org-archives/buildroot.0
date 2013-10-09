From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 16:35:22 +0200
Subject: [Buildroot] [PATCHv3 05/20] toolchain-buildroot: convert to the
	package infrastructure
In-Reply-To: <CAAXf6LUcykhJZ9UcUTB8+WSm7YMLXFwBOUnq2dOr8_i+L8ayVA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 9 Oct 2013 16:04:39
 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LUcykhJZ9UcUTB8+WSm7YMLXFwBOUnq2dOr8_i+L8ayVA@mail.gmail.com>
Message-ID: <87wqlm1phx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> +# Trigerring the build of the host-gcc-final will automatically do the
 >> +# build of binutils, uClibc, kernel headers and all the intermediate
 >> +# gcc steps.

 Thomas> It seems you miscorrected 'triggerring' after my comment on the first
 Thomas> version of your patch (and I did not yet have/take time to review v2
 Thomas> and v3). It should be:
 Thomas> Triggering (double g, single r instead of the other way around).

Ahh yes, will fix - Thanks.

-- 
Bye, Peter Korsgaard
