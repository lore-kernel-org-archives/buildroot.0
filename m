From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Jun 2019 21:10:28 +0200
Subject: [Buildroot] [PATCH v2 1/2] arch: Add support for Westmere
 targets
In-Reply-To: <20190611084410.4422-1-esben@geanix.com> (Esben Haabendal's
 message of "Tue, 11 Jun 2019 10:44:09 +0200")
References: <20190611084410.4422-1-esben@geanix.com>
Message-ID: <874l4ti9nf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Haabendal <esben@geanix.com> writes:

 > The westmere line of x86_64 targets lies between nehalem (corei7) and
 > sandybridge (corei7-avx).  Allowing use of -march=westmere enables use of
 > AES instruction set on these targets.

 > Signed-off-by: Esben Haabendal <esben@geanix.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
