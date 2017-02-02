From: Lionel Flandrin <lionel@svkt.org>
Date: Thu, 2 Feb 2017 10:21:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-pyzmq: bump to version 16.0.2
In-Reply-To: <20170201221233.0c7fef1d@free-electrons.com>
References: <20170131105048.916-1-lionel@svkt.org>
 <20170131112245.2181-1-lionel@svkt.org>
 <20170201221233.0c7fef1d@free-electrons.com>
Message-ID: <20170202092141.viqydzlcad4ze467@ed>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 01, 2017 at 10:12:33PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 31 Jan 2017 12:22:45 +0100, Lionel Flandrin wrote:
> 
> >  ...e-buildroot-zmq-version-instead-of-detect.patch | 52 ++++++++-------
> >  ...e-compile_and_run-with-compile_and_forget.patch | 76 ++++++++++++++++++++++
> 
> Could you submit this patch to the upstream project?

Will do.

> >  package/python-pyzmq/python-pyzmq.hash             |  5 +-
> >  package/python-pyzmq/python-pyzmq.mk               |  4 +-
> >  4 files changed, 111 insertions(+), 26 deletions(-)
> >  create mode 100644 package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch
> 
> Other than that: I've applied your patch to master. Thanks!

Thank you!

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
Lionel Flandrin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170202/1afb8418/attachment.asc>
