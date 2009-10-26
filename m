From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 26 Oct 2009 19:02:58 +0100
Subject: [Buildroot] [git commit master] libnl: handle all installed
 libraries
In-Reply-To: <878weyf3ca.fsf@macbook.be.48ers.dk>
References: <20091021082035.4DB3A7777B@busybox.osuosl.org>
	<4AE5C83B.7020101@zacarias.com.ar> <878weyf3ca.fsf@macbook.be.48ers.dk>
Message-ID: <1256580178.4186.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2009-10-26 at 18:54 +0100, Peter Korsgaard wrote:
> >>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
> 
>  Gustavo> Peter Korsgaard wrote:
>  >> commit: http://git.buildroot.net/buildroot/commit/?id=61901bd74a622450139358ea0c0f37d4568ad570
>  >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>  >> 
>  >> libnl does not only install libnl.so, but also libnl-nf.so,
>  >> libnl-genl.so and libnl-route.so. Change the post-install
>  >> and uninstall hooks to handle these libraries as well.
>  >> 
>  >> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
>  >> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> 
>  Gustavo> This broke the current version of the libnl package in buildroot since
>  Gustavo> libnl-* doesn't exist for libnl-1.1 (it's all in libnl.so) thus the
> 
> Uhh, that's no good - Sven?
> 
>  Gustavo> strip fails miserably.
>  Gustavo> Sven: Using git/libnl2 snapshot?

Uh, I am sorry. Looks like we updated libnl to version 2.0 some time ago
and I didn't send this update upstream. If you want I can send you a
patch for this. But since this is not really an upstream release but
just a snapshot, it's probably better to just revert the latest libnl
change. Sorry for the inconvenience.


Sven
