From: Ismael Luceno <ismael@iodev.co.uk>
Date: Mon, 4 Dec 2017 16:04:20 -0300
Subject: [Buildroot] [PATCH] axel: bump to version 2.16
In-Reply-To: <20171204091432.6e44856c@windsurf.home>
References: <20171125044447.7188-1-ismael@iodev.co.uk>
 <20171204091432.6e44856c@windsurf.home>
Message-ID: <20171204190419.GA9951@pirotess.bf.iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/Dec/2017 09:14, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 25 Nov 2017 01:44:47 -0300, Ismael Luceno wrote:
> > - Change upstream URL.
> > - Add optional dependency on libressl/openssl.
> > - Switch to autotools-package.
> > 
> > Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> 
> This update broke the build:
> 
>   http://autobuild.buildroot.net/?reason=axel-2.16
> 
> Could you look into it? Thanks a lot!

I'm going to release 2.16.1, probably tomorrow, fixing the issue. I
apologize for the delay, but I'm a little bit overloaded right now with
other stuff.
