From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Feb 2014 09:37:07 +0100
Subject: [Buildroot] What's the buildroot attitude to u-boot building?
In-Reply-To: <201402241433.49892.manningc2@actrix.gen.nz> (Charles Manning's
 message of "Mon, 24 Feb 2014 14:33:49 +1300")
References: <CAE21AQqMQmKKL0=Q55P2zQhV8+iBdpX416xK+SgZd3+ONi8Mgg@mail.gmail.com>
 <20140222001309.143e02f7@skate>
 <201402241433.49892.manningc2@actrix.gen.nz>
Message-ID: <87k3cknbyk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Manning <cdhmanning@gmail.com> writes:

Hi,

 >> While I don't find it particularly pretty, I kind of fail to see what
 >> troubles you think it could cause. Could you give more details about
 >> this?

 > I have used buildroot in the past to generate u-boot + MLO and have just 
 > ignored these special options, using my u-boot config instead.

 > Now I am looking at adding some configs, or working with existing ones, to add 
 > SOCFPGA handling. so I wanted to understand why things were done as they are 
 > so that I could do a better job.

I've also never used them (and disliked when they got added). Perhaps
the time has come to deprecate those options?

Anybody disagrees?

-- 
Bye, Peter Korsgaard
