From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 28 Sep 2016 00:13:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2016-09-22
In-Reply-To: <20160927204639.7b704407@gmx.net>
References: <20160923063043.9B0AD102740@stock.ovh.net>
 <CAKbGBLhk7nPvHr_X_=htCAuJp2CkrsH3_kPR5FOuArHahk+Wyw@mail.gmail.com>
 <20160927164145.41d6d6c4@free-electrons.com>
 <20160927204639.7b704407@gmx.net>
Message-ID: <20160927221308.GB1947@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Peter Seiderer wrote,

> Hello *,
> 
> On Tue, 27 Sep 2016 16:41:45 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > Hello,
> > 
> > (Added Waldemar + Buildroot ML in Cc)
> > 
> > On Thu, 22 Sep 2016 23:32:53 -0700, Steven Noonan wrote:
> > > It looks like this failed because pthreads was broken somehow. Could
> > > it be that the external toolchain didn't have libpthread or something?
> > 
> > Indeed, this seems like a uClibc issue. Waldemar, could you have a look
> > (see below the reference to the autobuilder failure).
> > 
> 
> Seems to be a similar failure as for the assimp package ([1]), linking with
> -lpthread seems not enough, but linking with -pthread succeeds:

I am really sure it is fixed with the update to uClibc-ng 1.0.18.

best regards
 Waldemar
