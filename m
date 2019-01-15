From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 14:22:40 +0100
Subject: [Buildroot] Migration to OpenSSL 1.1.1?
In-Reply-To: <20190115135640.762d0d4d@windsurf> (Thomas Petazzoni's message of
 "Tue, 15 Jan 2019 13:56:40 +0100")
References: <OFCE363AB5.EB39827A-ONC1258383.0037AF48-C1258383.0038BD5C@local-dmz.de>
 <CANQCQpYePwq3HHJxOjE3F=EFzp0=-AfPUL+KX0gtXyOrHU5p4A@mail.gmail.com>
 <20190115135640.762d0d4d@windsurf>
Message-ID: <87a7k2rr6n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> There are some efforts starting to bump to the latest stable 1.1.1.
 >> We're hoping we can get things bumped before things freeze for the
 >> next release.

 > The freeze for 2019.02 is going to happen at the end of January, I am
 > not sure this leaves us enough time to fix all the consequences of a
 > bump to OpenSSL 1.1.1.

 > However, since 2019.02 is going to be a LTS maintained for one year,
 > perhaps we want to have OpenSSL 1.1.1 in that LTS, knowing that it will
 > be maintained, while older OpenSSL versions might not. Is there any
 > information available on whether OpenSSL still maintains 1.0.x ? Peter,
 > what do you think ?

The official policy is listed here:

https://www.openssl.org/policies/releasestrat.html

So it will be supported almost (but not completely) until the end of the
2019.02 maintenance cycle.

Given how close we are to RC1, I would suggest we stick to 1.0.2 for
2019.02.

-- 
Bye, Peter Korsgaard
