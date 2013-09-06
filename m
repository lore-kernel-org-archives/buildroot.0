From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 6 Sep 2013 07:37:20 -0500
Subject: [Buildroot] [RFCv1 00/11] Convert toolchain backends to
 packages to fix source/external-deps/legal-info
In-Reply-To: <CAHkwnC_8gMrxTO_e8y2qg=NSZV6Bb2Wb+0kP9sEHphKXJuw1NQ@mail.gmail.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHkwnC_8gMrxTO_e8y2qg=NSZV6Bb2Wb+0kP9sEHphKXJuw1NQ@mail.gmail.com>
Message-ID: <OFC0E14F93.6E00FFAE-ON86257BDE.0044B2B1-86257BDE.00455616@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Fabio Porcedda <fabio.porcedda@gmail.com>
> 
> On Thu, Sep 5, 2013 at 11:27 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> 
> Hi Thomas,
> 
> > <snip>
> >
> > In the long term, I'm thinking of:
> >
> >  (1) Making 'toolchain' a dependency of all target packages, because
> >      it's really what it is.
> 
> About that i've already sent a patch "package: add toolchain
> dependency to inner-generic-package:
> http://patchwork.ozlabs.org/patch/237887/
> 
> I will rebase and send the patch after i sent the v3 for the top-level
> parallel make.
> 

I would really like to see this because one of my biggest 'annoyances' 
with buildroot is that if do a "make clean" and then "make <package>",
the toolchain doesn't copy over automatically. I use this sequence of 
commands to test that I have my dependancies correct when adding new
packages or just testing a specific package that it builds correctly.

Again this is just annoyance with a simple workaround but it is good 
to see that I'm not the only person with this annoyance. Thanks Fabio
for attempting to fix this.





Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/06e170d0/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/06e170d0/attachment.gif>
