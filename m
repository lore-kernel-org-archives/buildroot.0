From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 21:06:07 +0100
Subject: [Buildroot] ARM cores
In-Reply-To: <20110124180428.3bcbe29f@surf> (Thomas Petazzoni's message of
	"Mon, 24 Jan 2011 18:04:28 +0100")
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
	<87lj2ahe4y.fsf@macbook.be.48ers.dk> <20110124165711.381989cf@surf>
	<87y66athl7.fsf@macbook.be.48ers.dk> <20110124180428.3bcbe29f@surf>
Message-ID: <87y66arrrk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Instead of having the list of gazillions ARM SoC, we could also
 Thomas> extend a bit our architecture-specific options:

 Thomas>  * Has NEON support ?
 Thomas>    shown only if > ARMv7 is selected

 Thomas>  * Floating point type (with a choice of soft-float, VFPv2, VFPv3)

 Thomas>  * Floating point ABI (soft, softfp, hard)

 Thomas> But it means that the user needs more knowledge on the details of the
 Thomas> ARM SoC he is using. But it's probably the only realistic solution.

Yes, agreed.

-- 
Bye, Peter Korsgaard
