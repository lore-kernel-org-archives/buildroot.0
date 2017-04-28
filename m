From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 28 Apr 2017 02:32:06 +0200
Subject: [Buildroot] [PATCH] libmpeg2: fix sparc32 build
In-Reply-To: <87wpa6l0uy.fsf@dell.be.48ers.dk>
References: <20170427053609.GA20301@waldemar-brodkorb.de>
 <87wpa6l0uy.fsf@dell.be.48ers.dk>
Message-ID: <20170428003206.GX11446@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
>  > The output detection recognized wrong target output, because
>  > sparcv9 optimization flags used for sparcv8 build.
> 
>  > Fixes:
>  >   http://autobuild.buildroot.net/results/1b3158b03f7eaf5afb5a4dab9526091888f6c9b8
> 
>  > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Committed, thanks. Don't forget to submit it upstream as well.

Upstream looks very inactive to me, I don't think I will submit it there.

best
 Waldemar
