From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Nov 2017 11:54:41 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171101180319.qs5oueonqz2robr5@tarshish> (Baruch Siach's
 message of "Wed, 1 Nov 2017 20:03:19 +0200")
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <20171101180319.qs5oueonqz2robr5@tarshish>
Message-ID: <87efpheyry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 > make[2]: *** [jim/libjim.a] Error 1
 > make[2]: *** Waiting for unfinished jobs....

 >> Baruch, you are the last person who bumped this package, could you have a look?

 > The autobuilder indicates[1] that it only fails on Peter's gcc112 Powerpc 
 > host. Debugging this requires access to a Powerpc host.

You can request an account on the cfarm machines here:

https://cfarm.tetaneutral.net/users/new/

But I have just started a manual build on gcc112 to debug what the issue
is.

-- 
Bye, Peter Korsgaard
