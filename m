From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 11 Sep 2013 11:25:06 -0500
Subject: [Buildroot] Building Manual Errors
In-Reply-To: <CAHXCMMLZGQ0HreWYvXp1-bih+0yeG+8vCaw-Bb-_hpnpwUf7=A@mail.gmail.com>
References: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
 <CAHXCMMLZGQ0HreWYvXp1-bih+0yeG+8vCaw-Bb-_hpnpwUf7=A@mail.gmail.com>
Message-ID: <OFA28B8FB1.F5F3453D-ON86257BE3.005889A6-86257BE3.005A306C@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin <s.martin49@gmail.com> wrote on 09/11/2013 04:14:18 AM:
 
> Hi Ryan,
> 
> 2013/9/11 <rjbarnet@rockwellcollins.com>
> >
> > I've been trying to build the manual for buildroot using 'make 
> > manual' using two different machines that have Ubuntu 10.04 LTS and 
12.04 LTS.
> >
> > On Ubuntu 10.04 there was an unlisted dependancy with python-argparse
>
> My bad, I forgot this deps when I updated the manual.

No problem.

> > Another random thought, is there any plans to build all the tools 
> > needed for doing compile of the manual within buildroot so then we are
> > not dependent on the different distros of linux for building the 
manuals?
>
> Could be the solution.

I guess I was looking do some manual updates for the SELinux contributes 
that we are doing but I can't seem to build the manual to verify that
my formatting is correct since I haven't done much with ASCII docs.

Just briefly glancing through how many packages would have to added to 
buildroot in order to build all the packages need to compile the manual 
it looks like quite a few:

 * asciidoc
 * a2x
 * xsltproc
 * DocBook XSL Stylesheets
 * dblatex
 * FOP
 * w3m
 * Lynx
 * epubcheck
 * python argparse
 * python

There may be more but this was the dependancies that I saw when just
looking at what it would take to build asciidoc and a2x.

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130911/fb4f3387/attachment.html>
