From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 15:54:13 +0100
Subject: [Buildroot] [RFC] external toolchain scanner
In-Reply-To: <20170116084812.5e7bafeb@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 16 Jan 2017 08:48:12 +1100")
References: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
 <8037285d-a8b2-39c9-30c4-cba364583ae9@mentor.com>
 <20161208210228.GA27341@free.fr>
 <df15f689-fb98-5710-6c90-2ee0e5efb0be@mentor.com>
 <c542e7c5-39e9-5d1f-1611-63ad49d26371@mentor.com>
 <20170112173223.GA3716@free.fr>
 <ef0f8d40-903d-1859-aa45-d99b8fe49887@mentor.com>
 <fd01b978-5aea-2794-047c-968c7697b1bb@mind.be>
 <20170116084812.5e7bafeb@free-electrons.com>
Message-ID: <87wpdv9ht6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> But it's probably best to implement the first scenario and see where we go from
 >> there.

 > To be honest, I find all of this very complicated, and even more
 > confusing than what we have today. Using custom external toolchain is
 > already an "advanced" feature, which users just getting started with
 > Buildroot are unlikely to use. To me, using custom external toolchain
 > is a bit of an advanced functionality, and people who need that will
 > surely be able to understand the information they need to fill in
 > "menuconfig" to make Buildroot "accept" the toolchain.

Yes, I'm also not really sure what realistic use cases this scripts
covers.

 >> But perhaps that would be an easier first step. Instead of just reporting one
 >> single error, report all errors and the correct config options so the user can
 >> edit the .config file and add them.

 > Yes. *This* would be useful.

Agreed.

-- 
Bye, Peter Korsgaard
