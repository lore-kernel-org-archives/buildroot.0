From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Oct 2012 19:18:44 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-10-22
In-Reply-To: <871ugpnthy.fsf@macbook.be.48ers.dk>
References: <20121023063335.EB98F52C08F@lolut.humanoidz.org>
 <871ugpnthy.fsf@macbook.be.48ers.dk>
Message-ID: <50886944.1090602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/23/12 11:38, Peter Korsgaard wrote:

> This seems to be caused by the binutils sysroot patch. With that patch
> reverted the build works.
> 
> Care to take a look?

Actually it's messed up rpath logic in gnutls... apply patch and may it
rest in peace once and for all.
Regarding gnutls we are testing a move to gnutls-3.x with Thomas,
that'll follow once a whole bunch of testing/fixing is done.
Regards.
