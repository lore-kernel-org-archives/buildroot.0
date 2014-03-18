From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Mar 2014 09:05:10 +0100
Subject: [Buildroot] What's the buildroot attitude to u-boot building?
In-Reply-To: <20140318062125.772bd2e8@skate> (Thomas Petazzoni's message of
 "Tue, 18 Mar 2014 06:21:25 +0100")
References: <CAE21AQqMQmKKL0=Q55P2zQhV8+iBdpX416xK+SgZd3+ONi8Mgg@mail.gmail.com>
 <20140222001309.143e02f7@skate>
 <201402241433.49892.manningc2@actrix.gen.nz>
 <87k3cknbyk.fsf@dell.be.48ers.dk> <20140318062125.772bd2e8@skate>
Message-ID: <87zjko2aq1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > I have used buildroot in the past to generate u-boot + MLO and have just 
 >> > ignored these special options, using my u-boot config instead.
 >> 
 >> > Now I am looking at adding some configs, or working with existing ones, to add 
 >> > SOCFPGA handling. so I wanted to understand why things were done as they are 
 >> > so that I could do a better job.
 >> 
 >> I've also never used them (and disliked when they got added). Perhaps
 >> the time has come to deprecate those options?
 >> 
 >> Anybody disagrees?

 > I agree that those options are weird. I don't think we should be poking
 > into the U-Boot header files.

OK, then I will mark them as BR2_DEPRECATED_SINCE_2014_05.

-- 
Bye, Peter Korsgaard
