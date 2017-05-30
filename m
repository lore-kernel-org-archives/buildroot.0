From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 May 2017 09:13:14 +0200
Subject: [Buildroot] package hwloc does not install to staging
In-Reply-To: <66428c29-990f-e0d4-9164-92e5dae4e736@sfu.ca> (Graham Holland's
 message of "Mon, 29 May 2017 16:20:46 -0700")
References: <66428c29-990f-e0d4-9164-92e5dae4e736@sfu.ca>
Message-ID: <87mv9uakc5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Graham" == Graham Holland <gmh7@sfu.ca> writes:

 > Hello,
 > I'm curious if there is a reason for the hwloc package not including
 > the following:

 > HWLOC_INSTALL_STAGING = YES

 > so that the hwloc.h header is copied to the staging directory

 > I am porting a package that has a dependency on hwloc and which uses
 > pkg-config in its build system to detect hwloc compiler flags. If I
 > modify the hwloc.mk file to include the above, then this works
 > correctly.

I guess it was just missed when the package was submitted as it also
provides a bunch of utilities. Care to send a patch adding
HWLOC_INSTALL_STAGING?

-- 
Bye, Peter Korsgaard
