From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 26 Oct 2020 18:51:03 +0100
Subject: [Buildroot] Request for documenting HOST_LIBFOO_BUILD_CMDS
In-Reply-To: <CACna6ry9F7VrNPMo1mFyr-3CjQA+xNw=tJWK8ih_y0pN60NKrw@mail.gmail.com>
References: <CACna6ry9F7VrNPMo1mFyr-3CjQA+xNw=tJWK8ih_y0pN60NKrw@mail.gmail.com>
Message-ID: <20201026185103.070cc235@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rafa?,

On Mon, 26 Oct 2020 18:37:45 +0100, Rafa? Mi?ecki <zajec5@gmail.com> wrote:

> Hey,
> 
> I'm new to the buildroot and I just spent few hours developing my
> first (host) package. My main problem was buildroot not executing
> build commands.
> 
> In the documentation section "17.5.2. generic-package reference" there
> is description of LIBFOO_BUILD_CMDS without mentioning
> HOST_LIBFOO_BUILD_CMDS. While it must be obvious for existing
> developers, I find it misleading for newbies.

There is already some documentation about it, see [1]:

  For the target package, the generic-package uses the variables defined by the .mk
  file and prefixed by the uppercased package name: LIBFOO_*. host-generic-package
  uses the HOST_LIBFOO_* variables. For some variables, if the HOST_LIBFOO_ prefixed
  variable doesn?t exist, the package infrastructure uses the corresponding variable
  prefixed by LIBFOO_. This is done for variables that are likely to have the same
  value for both the target and host packages. See below for details.

> 
> Could someone familiar with buildroot document that, please?
> Otherwise buildroot's documentation is really great, thanks a lot
> everyone involved in it :)
> 

Maybe it is a little bit hidden and could be more emphasized...

Regards,
Peter
 
[1] https://buildroot.org/downloads/manual/manual.html#generic-package-reference
