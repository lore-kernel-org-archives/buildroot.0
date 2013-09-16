From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Sep 2013 18:21:10 +0200
Subject: [Buildroot] [PATCHv2 04/14] gcc: fix Fortran support
In-Reply-To: <20130916180258.37e82f48@skate>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87eh8pkd53.fsf@dell.be.48ers.dk> <20130916173812.5c424599@skate>
 <CAHXCMMLm_xxEGsAX+Yz+QQoAgozXCo_h3ftcrkbxcqz68yQ8KQ@mail.gmail.com>
 <20130916180258.37e82f48@skate>
Message-ID: <CAHXCMMLtY+Byxd6Xy765wFh+on8+kD-PoZJc9T351ca3ig+oKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/16 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Samuel Martin,
>
> On Mon, 16 Sep 2013 17:53:53 +0200, Samuel Martin wrote:
>
> > > I have no idea. I believe Objective-C is completely useless. However, I
> > > believe Fortran *might* be useful for some scientific applications that
> > > could be used on embedded devices. But the fact that no-one ever
> > > complained about our Fortran support being broken (the runtime library
> > > was never copied to the target) is a fairly strong indication that
> > > nobody is using this.
> > >
> > I confirm.
> > I have not checked recently, but few versions ago, fortan was needed to
> > build opencv.
>
> Doh? Where is this information coming from? There might be a Fortran
> API to OpenCV, but I really doubt that Fortran is a requirement to
> build OpenCV, because we don't enable Fortran in any of our
> configurations, and still OpenCV builds fine.
>

Well, after checking, fortran seems not need anymore to build opencv, for
at least 2 years...


-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130916/4bc65e0c/attachment-0001.html>
