From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 18:24:42 +0100
Subject: [Buildroot] customize package: odd copy construction
In-Reply-To: <20120105163648.3bf64bcd@skate> (Thomas Petazzoni's message of
 "Thu, 5 Jan 2012 16:36:48 +0100")
References: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
 <20120105163648.3bf64bcd@skate>
Message-ID: <878vle9mp1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Why would you create a series file first if you're removing it
 >> immediately afterwards?
 >> Doesn't the original copy statement do exactly the same?

 Thomas> I don't know, but I'm not sure this customize package is good example
 Thomas> these days. It should probably be removed, or changed to something
 Thomas> saner that uses the package infrastructure.

I agree. What about marking it as deprecated for now?

-- 
Bye, Peter Korsgaard
