From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 5 Jan 2018 10:24:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-01-04
In-Reply-To: <20180105095938.39a18748@windsurf.lan>
References: <20180105070004.41340207B4@mail.free-electrons.com>
 <20180105084309.GB8058@airbook.vandijck-laurijssen.be>
 <20180105095938.39a18748@windsurf.lan>
Message-ID: <20180105092451.GE8058@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Hello,
> 
> On Fri, 5 Jan 2018 09:43:09 +0100, Kurt Van Dijck wrote:
> 
> > > Results for the 'master' branch
> > > ===============================
> > > 
> > > Build failures related to your packages:
> > > 
> > >       xtensa |             nilfs-utils-v2.2.7 | http://autobuild.buildroot.net/results/a9fe41ed428d26ef5500cec9f762c0bae3eebd39  
> > 
> > I just ran this on my local branch, including the patches I sent
> > yesterday (and are still pending), and that went ok, so I propose
> > to wait and see until those 2 patches are accepted/denied.
> > 
> > Just a question.
> > I don't understand why xtensa fails today and not yesterday ...
> > Is there a random toolchain selection everyday for each package to save
> > buildserver resources?
> 
> The autobuilders only do random testing. Essentially, what they do is:
> 
>  - Pick a random architecture/toolchain configuration among the one
>    available in support/config-fragments/autobuild/
> 
>  - Run "make randpackageconfig" to generate on top of the
>    architecture/toolchain configuration a random selection of packages.
> 
>  - Build
> 
> So the results every day are different, since it's completely random
> what testing is being done. This allows us to test a very wide variety
> of package/toolchain/architecture combinations, since doing an
> exhaustive testing is simply impossible when you have thousands of
> Config.in options.

I see.
I understand the impossibility :-)
Thanks for sharing.

Kurt
