From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 18:02:58 +0200
Subject: [Buildroot] [PATCHv2 04/14] gcc: fix Fortran support
In-Reply-To: <CAHXCMMLm_xxEGsAX+Yz+QQoAgozXCo_h3ftcrkbxcqz68yQ8KQ@mail.gmail.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87eh8pkd53.fsf@dell.be.48ers.dk> <20130916173812.5c424599@skate>
 <CAHXCMMLm_xxEGsAX+Yz+QQoAgozXCo_h3ftcrkbxcqz68yQ8KQ@mail.gmail.com>
Message-ID: <20130916180258.37e82f48@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 16 Sep 2013 17:53:53 +0200, Samuel Martin wrote:

> > I have no idea. I believe Objective-C is completely useless. However, I
> > believe Fortran *might* be useful for some scientific applications that
> > could be used on embedded devices. But the fact that no-one ever
> > complained about our Fortran support being broken (the runtime library
> > was never copied to the target) is a fairly strong indication that
> > nobody is using this.
> >
> I confirm.
> I have not checked recently, but few versions ago, fortan was needed to
> build opencv.

Doh? Where is this information coming from? There might be a Fortran
API to OpenCV, but I really doubt that Fortran is a requirement to
build OpenCV, because we don't enable Fortran in any of our
configurations, and still OpenCV builds fine.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
