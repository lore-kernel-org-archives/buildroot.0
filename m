From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Dec 2009 20:42:56 +0100
Subject: [Buildroot] [PATCH] Adding openbox to buildroot
In-Reply-To: <200912021324.52697.minimod@morethan.org> (Michael S. Zick's
	message of "Wed, 2 Dec 2009 13:24:50 -0600")
References: <867286CD-192F-48CE-8C3A-00D988A93C6B@hsr.ch>
	<4d28d4b50912020911h52ef1e70j88e8c5b592fc66f@mail.gmail.com>
	<1CB99035-2FC1-42B4-B73D-02CAF7A55020@hsr.ch>
	<200912021324.52697.minimod@morethan.org>
Message-ID: <87my21tb5r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 >> ? Pkg-config

 Michael> Building pkgconfig is optional.  
 Michael> If selected, it requires that Internationalism and
 Michael> wide-character be pulled in.

pkg-config is a compile time dependency, not a runtime one - So this is
about pkg-config for the host.

-- 
Bye, Peter Korsgaard
