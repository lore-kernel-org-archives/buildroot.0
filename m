From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2016 16:41:45 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-09-22
In-Reply-To: <CAKbGBLhk7nPvHr_X_=htCAuJp2CkrsH3_kPR5FOuArHahk+Wyw@mail.gmail.com>
References: <20160923063043.9B0AD102740@stock.ovh.net>
 <CAKbGBLhk7nPvHr_X_=htCAuJp2CkrsH3_kPR5FOuArHahk+Wyw@mail.gmail.com>
Message-ID: <20160927164145.41d6d6c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Added Waldemar + Buildroot ML in Cc)

On Thu, 22 Sep 2016 23:32:53 -0700, Steven Noonan wrote:
> It looks like this failed because pthreads was broken somehow. Could
> it be that the external toolchain didn't have libpthread or something?

Indeed, this seems like a uClibc issue. Waldemar, could you have a look
(see below the reference to the autobuilder failure).

Thanks a lot!

Thomas

> 
> On Thu, Sep 22, 2016 at 11:30 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > This is the list of Buildroot build failures that occured on
> > 2016-09-22, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Build failures related to your packages:
> >
> >         m68k |                   powertop-2.7 | http://autobuild.buildroot.net/results/5c63959a89d5761fdefe3bfd36c8168dbe882dc9
> >
> > --
> > http://autobuild.buildroot.net  



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
