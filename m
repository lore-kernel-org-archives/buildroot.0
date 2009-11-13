From: Bogdan Cristea <cristeab@gmail.com>
Date: Fri, 13 Nov 2009 19:45:47 +0200
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <a038bef50911130714h60c67057td0cccaa499ff173f@mail.gmail.com>
References: <200911121623.45929.cristeab@gmail.com>
	<200911131646.42695.cristeab@gmail.com>
	<a038bef50911130714h60c67057td0cccaa499ff173f@mail.gmail.com>
Message-ID: <200911131945.47830.cristeab@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 13 November 2009 17:14:59 you wrote:
> On Fri, Nov 13, 2009 at 9:46 AM, Bogdan Cristea <cristeab@gmail.com> wrote:
> > when using your .config file my compilation fails due to a missing patch
> > file mpfr-2.4.1.patch. What is the role of that patch ?
> 
> mpfr is used when generating gcc with floating point support. Its not
> something I've added locally.
> 
> My buildroot repository is based off the commit id 5e5f3209f which has
> got numerous changes since the 2009.08 release (including some in
> mpfr). If you do want to persue using my config you may want to get
> fresh git clone and seek to the same point as me. i.e.
> 
>    git clone  http://git.buildroot.net/buildroot
>    cd buildroot
>    git checkout -b test 5e5f3209f
> 
> Failing that maybe you just want to compare your config to mine and
> see if you have a bunch of extra packages that are causing your target
> file system to be so big.
> 

Thank you Chris, finally I have managed to boot a linux image in QEMU. The 
problem seems to be the version of buidroot I have used: 2009.08
