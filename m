From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Apr 2012 09:39:01 +0200
Subject: [Buildroot] [git commit] audiofile: new package
In-Reply-To: <20120427091956.51519c23@skate> (Thomas Petazzoni's message of
 "Fri, 27 Apr 2012 09:19:56 +0200")
References: <20120425101023.D67C396BAF@busybox.osuosl.org>
 <20120427091956.51519c23@skate>
Message-ID: <877gx1aaju.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Looks like this new package is causing build issues:
 Thomas> http://autobuild.buildroot.org/results/0898cc3cfe4d17c894b9c94cd0a0a7a6c24bebc1/build-end.log.
 Thomas> I haven't investigated whether it's a package problem or a more general
 Thomas> toolchain problem.

I would say toolchain problem as it built here and E.G. with your
powerpc config:

http://autobuild.buildroot.org/results/6597fe6dba69672486a5534890010de76155e80d/defconfig

-- 
Bye, Peter Korsgaard
