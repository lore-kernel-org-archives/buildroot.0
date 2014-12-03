From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 3 Dec 2014 14:18:25 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-12-02
In-Reply-To: <87vblsyhgj.fsf@dell.be.48ers.dk>
References: <20141203073017.2AC17100ADA@stock.ovh.net>	<547F12F3.70505@imgtec.com>
 <87vblsyhgj.fsf@dell.be.48ers.dk>
Message-ID: <547F1BB1.5020209@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/2014 01:46 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > On 12/03/2014 07:30 AM, Thomas Petazzoni wrote:
>  >> Build statistics for 2014-12-02
> 
>  >> mips | xlib_libXau-1.0.8 | NOK |
>  >> http://autobuild.buildroot.net/results/b8474b85315a0424870fc655dc89324bb1193d44/
> 
>  > I cannot reproduce this even using the same .config file. However I have
>  > found that xlibx_libXau also needs to have host-pkgconf on its
>  > dependences. Otherwise it would fail with an error like this one:
> 
>  > checking for XAU... configure: error: in
>  > `/br/output/build/xlib_libXau-1.0.8':
>  > configure: error: The pkg-config script could not be found or is too
>  > old.  Make sure it
>  > is in your PATH or set the PKG_CONFIG environment variable to the full
>  > path to pkg-config.
> 
>  > I will send a patch today.
> 
> Thanks. Judging from the error message, that is most likely the reason
> for the failure.

I don't think so, because if you see the build-time.log, host-pkgconf
was already installed:

http://autobuild.buildroot.net/results/b84/b8474b85315a0424870fc655dc89324bb1193d44/build-time.log

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
