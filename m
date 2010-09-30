From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Sep 2010 23:47:35 +0200
Subject: [Buildroot] [SECURITY][PATCHv2] Bump quagga to 0.99.17
In-Reply-To: <87k4m3xbc1.fsf@macbook.be.48ers.dk>
References: <4CA4A278.6040303@zacarias.com.ar>
	<87ocbfxcsg.fsf@macbook.be.48ers.dk>
	<4CA4E521.30407@zacarias.com.ar>
	<87k4m3xbc1.fsf@macbook.be.48ers.dk>
Message-ID: <20100930234735.4ffdc3ea@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Sep 2010 21:47:42 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Could someone using the external toolchain (Thomas?) give netsnmp a
> quick test?

I confirm that since Gustavo converted the package to autotargets, the
previously existing build failures with external toolchain have
disappeared. I just tested with a recent (a few days) Git, and net-snmp
built just fine with an external ARM CodeSourcery toolchain.

Now, I have no idea if it actually works, since I don't know how to
test it. But that's another story :-)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
