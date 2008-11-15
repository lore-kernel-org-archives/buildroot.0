From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Nov 2008 22:29:57 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909D3E78E@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Fri\,
	14 Nov 2008 11\:42\:45 -0500")
References: <20081113163256.D28F83C8A1@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909D3E78E@mi8nycmail19.Mi8.com>
Message-ID: <874p28ekyy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> With revision 24042 of buildroot I get an error building busybox. During
 hartleys> the build I get:

Yes, busybox 1.13.0 id applet requires functionality not available in
uclibc 0.9.29 / 0.9.28.

I've disabled the id applet in the default config for now.

-- 
Bye, Peter Korsgaard
