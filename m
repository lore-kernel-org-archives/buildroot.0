From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jan 2011 11:55:03 +0100
Subject: [Buildroot] [PATCH v2] New package: can-utils
In-Reply-To: <4D2DCB65.6080502@visionsystems.de> (Yegor Yefremov's message of
	"Wed, 12 Jan 2011 16:40:21 +0100")
References: <4D07935A.1070505@visionsystems.de>
	<4D2DCB65.6080502@visionsystems.de>
Message-ID: <8762tasjjs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Please, don't apply this patch. SocketCAN devs are about to
 Yegor> create official distribution and the package name will be
 Yegor> changed. I'll post a proper patch as soon as the distro is
 Yegor> finished.

Ok, great. The utilities are quite small, but perhaps it would be nice
to add config options to choose what tools to build/install
(E.G. similar to how we do it for input-tools).

-- 
Bye, Peter Korsgaard
