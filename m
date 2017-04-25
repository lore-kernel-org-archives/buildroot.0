From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 25 Apr 2017 13:17:34 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?=5BPATCH=5D_gcc=3A_Fix_build_failure_r?=
	=?iso-8859-1?q?elated_to_-fPIC_for_x86=5F64_-=3E_i686_builds?=
In-Reply-To: <4697e49d-c953-cf51-2361-3e5d06bdd21b@mind.be>
References: <71cfdaf7-367d-44de-a1c6-9041e269c8de@cesnet.cz>
 <aded779d-fd0d-e83c-5a3e-d0e7b28b5dfe@mind.be>
 <8b7a3f29-c200-4292-8efb-8f6f24c3e7c7@cesnet.cz>
 <4697e49d-c953-cf51-2361-3e5d06bdd21b@mind.be>
Message-ID: <207c32d9-841e-4a51-8f91-1a2475c4b45d@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On pond?l? 24. dubna 2017 22:21:28 CEST, Arnout Vandecappelle wrote:
> No, if you managed to build all these host packages with the 
> default-PIE host compiler, then I guess it's OK.

You're right. Indeed, my regular PIE-using compiler is used when building 
these host utilities. Sorry for this confusion on my side re `make 
foo-rebuild`.

Does that change your position on the original patch? Should I 
resend/reformat it to explicitly refer to the Gentoo Hardened compiler 
which is happy to use PIC/PIE? Or is that nonetheless something that does 
not belong to Buildroot in your opinion?

Cheers,
Jan
