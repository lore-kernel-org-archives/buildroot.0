From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Nov 2014 14:12:52 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-07
In-Reply-To: <5460A71B.2010201@imgtec.com> (Vicente Olivert Riera's message of
 "Mon, 10 Nov 2014 11:52:59 +0000")
References: <20141108073013.7C0431015EA@stock.ovh.net>
 <5460A71B.2010201@imgtec.com>
Message-ID: <87wq73nqqz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 >> mips64el | checking sys/uio.h presence... | TIM | http://autobuild.buildroot.net/results/0e6c67d1069848623ca2f62209909eadbc696d62/

 > checking sys/uio.h presence... make: ***
 > [/home/peko/autobuild/instance-2/output/build/netatalk-3.1.2/.stamp_configured]
 > Terminated
 > Terminated

 > Autobuilder timeout?

Yes, that's what the 'TIM' above means.


 >> mipsel |                   connman-1.26 | NOK | http://autobuild.buildroot.net/results/64742a1d3a07f86a7c801da5ef30892c1f760031/

 > checking for dlopen in -ldl... no
 > configure: error: dynamic linking loader is required

 > Connman needs a toolchain with dynamic library. Patches sent:

 >   http://patchwork.ozlabs.org/patch/408901/
 >   http://patchwork.ozlabs.org/patch/408902/

Thanks, I'll take a look at them now.


 >> mips64el |                  samba4-4.1.13 | TIM | http://autobuild.buildroot.net/results/d7956295a2da3208fb26bf1ab06d13cdfbaf0f36/

 > This one looks like another autobuilder timeout.

Indeed.

-- 
Bye, Peter Korsgaard
