From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 17:51:08 +0100
Subject: [Buildroot] [PATCH 4/5] package/binutils: drop 2.33.x series
In-Reply-To: <b8776d72-712d-1743-8027-07032e04d774@gmail.com> (Romain Naour's
 message of "Tue, 2 Feb 2021 22:16:18 +0100")
References: <20210131223304.1857838-1-thomas.petazzoni@bootlin.com>
 <20210131223304.1857838-4-thomas.petazzoni@bootlin.com>
 <87ft2fn1dr.fsf@dell.be.48ers.dk>
 <b8776d72-712d-1743-8027-07032e04d774@gmail.com>
Message-ID: <87tuqrdber.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Hello Peter,
 > Le 01/02/2021 ? 18:28, Peter Korsgaard a ?crit?:
 >>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
 >> 
 >> > Now that 2.36.x has been added, that 2.35.x is the default version,
 >> > drop support for 2.33.x.
 >> 
 >> > Note that we keep binutils 2.32.x as it is the latest version that
 >> > works for FLAT binaries (used on noMMU platforms).
 >> 
 >> :/ Does upstream know about this? Do they not care?

 > It's not really an issue with Binutils but elf2flt tool:

 > https://github.com/uclinux-dev/elf2flt/issues/12

 > I just noticed a new PR that is interesting to fix the issue:
 > https://github.com/uclinux-dev/elf2flt/pull/20

Ok, thanks - Hopefully that indeed fixes the issues.

-- 
Bye, Peter Korsgaard
