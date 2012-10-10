From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Wed, 10 Oct 2012 18:56:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-10-09
In-Reply-To: <20121010124644.55d52fff@skate>
References: <20121010063409.D3FD652C6A6@lolut.humanoidz.org>
 <878vbeabds.fsf@macbook.be.48ers.dk>
 <20121010122914.0685ae62@skate>
 <874nm2aa44.fsf@macbook.be.48ers.dk>
 <20121010124644.55d52fff@skate>
Message-ID: <20121010165620.GA21086@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 10, 2012 at 12:46:44PM +0200, Thomas Petazzoni wrote :
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
> 

Anyway, downloading the cryptographic hash/signature from the same host
would make no sense as it would probably be tempered with at the same
time as the package itself. In the case we want to ensure integrity,
buildroot should come with the cryptographic hash of each package, in
the .mk files for example.


-- 
Alexandre Belloni
