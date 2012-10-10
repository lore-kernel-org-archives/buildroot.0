From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Oct 2012 07:52:49 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-10-09
In-Reply-To: <20121010124644.55d52fff@skate>
References: <20121010063409.D3FD652C6A6@lolut.humanoidz.org>
 <878vbeabds.fsf@macbook.be.48ers.dk> <20121010122914.0685ae62@skate>
 <874nm2aa44.fsf@macbook.be.48ers.dk> <20121010124644.55d52fff@skate>
Message-ID: <50755381.4070405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/12 07:46, Thomas Petazzoni wrote:

>> But yeah, I'll change the alioth downloads to http.
> 
> Ok. I am not a security expert, but I am not sure that downloading
> those things from https:// gives any win over a http:// download. What
> would be more interesting is to be able to verify the cryptographic
> signature of those tarballs (or the signature of a hash of those
> tarballs), to actually be able to verify that those tarballs have
> really been emitted by whoever is supposed to emit those tarballs. But
> that's another story, and there are probably many projects that don't
> provide cryptographic signatures to verify the authenticity of
> the tarballs.

If the certificate is not signed by one of the usual/trusted CAs then
it's a problem and yeah, switch to http.
It's open source, so it's not like we are downloading some sekrit NDA
source or something, encrypting it is of no value.
Checking integrity via hash+size like i proposed some time ago and got a
nay is what should be done :)
Regards.
