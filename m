From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Aug 2014 19:22:31 +0200
Subject: [Buildroot] [UNSURE]Analysis of build failures
In-Reply-To: <CAB0FRsvHq07bEMyQtkFvD343=kDKNyxPfqfFEip6dXeM+3ikag@mail.gmail.com>
References: <20140813063010.CD21010118A@stock.ovh.net>
 <20140813101514.384e1435@free-electrons.com>
 <CAB0FRsvHq07bEMyQtkFvD343=kDKNyxPfqfFEip6dXeM+3ikag@mail.gmail.com>
Message-ID: <20140813192231.0ee2095c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Wed, 13 Aug 2014 18:53:10 +0200, Fran?ois Perrad wrote:

> > This has been causing a good number of build issues. Fran?ois, is there
> > something we can do to fix this?
> 
> building a host-perl, but after this release 14.08.
> perl-gd is broken only on the machine gcc10.

Then I believe we should mark the perl-gd package as broken for now, so
that we don't have those repeated autobuilder failures.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
