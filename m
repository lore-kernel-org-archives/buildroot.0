From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 19 Sep 2013 10:20:08 -0500
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
	dependencies first
In-Reply-To: <CAAXf6LWOeKch8sQ7H3qbKG3CEtL=R0mO1vZY38aggUNo6mtVcA@mail.gmail.com>
References: <patchbomb.1379587632@argentina>	<246bed054da59d6508dc.1379587635@argentina>
 <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>	<CAAXf6LW=7dUUEjGHp6xVFy9-SEXVuUyiK8Lvom2imyCX=s+3oQ@mail.gmail.com>
 <OF255A0DB6.0256D3EC-ON86257BEB.004C84DB-86257BEB.004F7C41@rockwellcollins.com>
 <CAAXf6LWOeKch8sQ7H3qbKG3CEtL=R0mO1vZY38aggUNo6mtVcA@mail.gmail.com>
Message-ID: <OF35F90E21.2F95AFCB-ON86257BEB.0053D79C-86257BEB.00543DF9@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 09/19/2013 
10:08:03 AM:
 
> Hi Ryan,
> 
> On Thu, Sep 19, 2013 at 4:28 PM, Ryan Barnett
> <rjbarnet@rockwellcollins.com> wrote:
> >
> >
> > I was also going to to add to the documentation the versions of the 
Ubuntu
> > packages that I got the manual to build with. Ubuntu version + package
> > version so that way in the manual we can give a reference system
> > configuration that we say builds the manual. For Ubuntu 10.04 I was 
having
> > issues building the manual but with Ubuntu 12.04 I could successfully 
build
> > everything.
> >
> > I haven't had a chance to get around to doing this yet so I don't know 
if
> > you want to add your Ubuntu configuration as a reference configuration 
for
> > generating the manual under Section 3.2? Maybe this warrants a 
subsection
> > (3.2.1) in manual for generating the manual? If you don't get around 
to
> > doing this, I will when I get around to adding some documentation to 
the
> > regarding SELinux and information about patch reviews.
> 
> I'm wondering whether this is very useful. A user will not install
> another Linux distribution just to build the buildroot manual, so the
> Ubuntu version doesn't seem necessary to me. The package version only
> seems relevant in case we know that some versions give problems for
> building the manual. But unless we have some more info on that, I
> would not add such info to the manual (also because it is very quickly
> out-of-date).

I'm sorry I misspoke and I do agree with you that we should just give the
version of asciidoc/w3m/(don't remember the other packages). After I sent
the previous message I figured that wasn't good idea. But I still think
that it would be helpful to have the versions of the tools that are used
and the version for which they are known to work for.
 
> For the problems you saw on Ubuntu 10.04, there may be a solution with
> asciidoc 8.6.3, as I just posted in your original thread. If this
> could be verified, then we could update the manual with just that.

Thanks - I never really had time to track down the solution or what
version issue was fixed at. I've replied with the information to the email
on that original thread.

> 
> Best regards,
> Thomas

Thanks,
-Ryan



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/cdd4943d/attachment.html>
