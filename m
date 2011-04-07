From: Allan Nielsen <a@awn.dk>
Date: Thu, 7 Apr 2011 14:51:34 +0200
Subject: [Buildroot] Binary ATI driver package in buildroot
In-Reply-To: <20110406164259.561b2511@surf>
References: <1302088845-15193-1-git-send-email-a@awn.dk>
	<20110406153502.13c6affd@surf>
	<BANLkTinVhQdOqVJdkO9gK8Q==1j1uf_=BA@mail.gmail.com>
	<20110406164259.561b2511@surf>
Message-ID: <BANLkTi=a7NTbfuCMFRSXACPjGQWfE5O6XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey

> Unfortunately for the moment, it is not possible to override the
> extraction step of a package by defining the <pkg>_EXTRACT_CMDS
> variable. Buildroot asumes that each package is a tarball that can be
> extracted as usual.

Okay, I see....

> Or if you want to do it the clean way, add the possibility of
> overriding the extraction step in the package infrastructure.

I have created a small patch for Makefile.package.in which allows
packages to override the extraction step. I'am not completely sure if
this was the solution you had in mind, but to me it seems like a
harmless fix. I will post this fix along with a new version of the ATI
driver which is based on gentargets. The new patch will be based
directly on the master branch.

--
Allan W. Nielsen
