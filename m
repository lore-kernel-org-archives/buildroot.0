From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:27:06 +0200
Subject: [Buildroot] [PATCH 1/1] mono: remove copy of host etc files on
 install
In-Reply-To: <CA+TH9VnNgxSvsUiSTPUstqpa3uuEbKbMxR+OfK1xMEdDqq3Z0w@mail.gmail.com>
References: <20170315022458.14160-1-dustin.r.johnson@gmail.com>
 <20170318153923.56903d45@free-electrons.com>
 <CABAk6Mp6C8v=JFiQAnRJPc+NYDoLaRrx7L5YrakC9wJfQbzMFQ@mail.gmail.com>
 <CA+TH9VnNgxSvsUiSTPUstqpa3uuEbKbMxR+OfK1xMEdDqq3Z0w@mail.gmail.com>
Message-ID: <20170513152706.0319d7de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Thu, 6 Apr 2017 19:08:35 +0200, Angelo Compagnucci wrote:

> > Below is the diff between staging and host. I am using a Ubuntu VM to
> > compile for an ARM target with uCLibc.
> > The appropriate .so files (libc.so.0) are referenced in the config file in
> > the staging directory but not in the host.
> > The patch I referenced in my commit is:
> >   * package/mono/0002-Adjust-libc.so-path-depending-on-C-
> > library-being-use.patch
> > This patch addresses the proper generation of the /etc/mono/config file in
> > the staging directory, I believe.
> >
> > Thanks!
> >  
> 
> Could you send me a minimal example that exibits the problem?!

Do you have some further feedback on this issue? Dustin's patch is
still pending, waiting for you to confirm or not the issue and indicate
if Dustin's solution is the most appropriate or not.

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
