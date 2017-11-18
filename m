From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Nov 2017 09:26:03 +0100
Subject: [Buildroot] out of tree kernel patches question
In-Reply-To: <trinity-0708c540-baa1-463a-a0ad-5bf573ebc7e7-1510991011672@3c-app-mailcom-bs13>
 (daggs@gmx.com's message of "Sat, 18 Nov 2017 08:43:31 +0100")
References: <trinity-0d97f4a0-c1ac-416e-bfea-7bcafcb3ce1d-1510924577452@3c-app-mailcom-bs07>
 <20171117212417.43162ed7@windsurf.lan>
 <trinity-0708c540-baa1-463a-a0ad-5bf573ebc7e7-1510991011672@3c-app-mailcom-bs13>
Message-ID: <87shdcvvqc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

Hi,

 > so I'd like to propose adding a new buildroot config named
 > odroidc2-next which will support that along side the existing one.
 > with time, hopefully, the old one will be replaced by the new one.

 > any objections?

I don't think "next" really explains what this is about, what about
odroidc2_mainline_defconfig?

We have a number of other boards where it may be interesting to do so,
E.G. rpi, roseapplepi, ..

-- 
Bye, Peter Korsgaard
