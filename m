From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 May 2009 12:26:04 +0200
Subject: [Buildroot] [PATCH] gcc-4.3.3: add a patch to link with the
	math lib to get copysignal
In-Reply-To: <1241553892-17581-1-git-send-email-angus.salkeld@alliedtelesis.co.nz>
	(Angus Salkeld's message of "Wed\, 6 May 2009 08\:04\:52 +1200")
References: <4A00C388.CHCDOM1.CHCPO1.100.1706A38.1.15693.1@1:49F559F8.CHCDOM1.CHCPO1.100.1706A38.1.15208.1@13>
	<1241553892-17581-1-git-send-email-angus.salkeld@alliedtelesis.co.nz>
Message-ID: <873aba7h37.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angus" == Angus Salkeld <angus.salkeld@alliedtelesis.co.nz> writes:

Hi,

 Angus> Conditionally apply the following patch by Bernhard
 Angus> Reutner-Fischer which solves a link error on powerpc (with
 Angus> softfloat or multilib) when using a shared libgcc_s.

Thanks, applied.

-- 
Bye, Peter Korsgaard
