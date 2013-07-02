From: Milton Soares Filho <milton.soares.filho@gmail.com>
Date: Tue, 2 Jul 2013 13:31:04 -0300
Subject: [Buildroot] ldconfig - unknown machine 40
In-Reply-To: <1372765788.4683.13.camel@dublxciaranr1.verifone.com>
References: <loom.20130628T172450-675@post.gmane.org>
 <CAPNngRMnWn3gAo3ut1GmoVJmCh2yiGu=2sUFWWXkTrL4M-NR6Q@mail.gmail.com>
 <1372765788.4683.13.camel@dublxciaranr1.verifone.com>
Message-ID: <CAPNngROZPybYo4pkY3GXFgH8yONY9bXwMU7o23hmQ39J=0BN=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 July 2013 08:49, Ciar?n Rehill <cir.vfi@gmail.com> wrote:
> Is it normal not to supply a cross-ldconfig with a toolchain release or
> is there a standard policy on this?

I haven't found a cross-ldconfig within both sh4 and broadcom
toolchains which I have available.

> Is it possible to build the ldconfig from source without going through a
> full toolchain build process, given that the majority of the components
> already exist?

Oh, I've lamely tried a 'make host-ldconfig' before reasearching the issue :-P

[]s, milton
