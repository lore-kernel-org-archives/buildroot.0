From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 17:25:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/perl-extutils-pkgconfig: set
 PATH to BR_PATH
In-Reply-To: <20210217064949.1787888-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 17 Feb 2021 07:49:49 +0100")
References: <20210217064949.1787888-1-fontaine.fabrice@gmail.com>
Message-ID: <87im6q3blw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set PATH to BR_PATH to allow perl-extutils-pkgconfig to find pkg-config
 > binary

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d87787fbf2a8cb9bbaa3b59d1e8004ad1459536a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
