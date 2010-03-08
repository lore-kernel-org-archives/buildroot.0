From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Mar 2010 20:29:43 +0100
Subject: [Buildroot] Patch to allow iproute2 without IPv6 requirement
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE10992AA56@tranzeo-mail2.12stewart.tranzeo.com>
	(Darcy Watkins's message of "Mon, 8 Mar 2010 06:49:15 -0800")
References: <D61182AC8012EA4EBC531B3AF23BE10992A96A@tranzeo-mail2.12stewart.tranzeo.com>
	<1267220120.28886.99.camel@localhost.localdomain>
	<1267473268.25711.10.camel@localhost.localdomain>
	<87aaul15l3.fsf@macbook.be.48ers.dk>
	<D61182AC8012EA4EBC531B3AF23BE10992AA56@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <87d3zezk60.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Darcy" == Darcy Watkins <DWatkins@tranzeo.com> writes:

 Darcy> Hi Peter,
 Darcy> After some second thought, the "IPV6_OPT" variable I used in the patch
 Darcy> part to iproute2.mk should probably have an appropriate prefix prepended
 Darcy> to it to avoid potential for future namespace conflicts in case
 Darcy> something similar happens for another package.

Yes, I was thinking the same thig.

 Darcy> For example use "IPROUTE2_IPV6_OPT" or something similar instead of
 Darcy> "IPV6_OPT".

 Darcy> I've also just submitted the patch to iproute2 code itself upstream.

Great. Do you have a URL to the mailing list archive and/or bug tracker,
then I'll add that to the patch header.

-- 
Bye, Peter Korsgaard
