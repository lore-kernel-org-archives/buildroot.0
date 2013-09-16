From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Sep 2013 17:53:53 +0200
Subject: [Buildroot] [PATCHv2 04/14] gcc: fix Fortran support
In-Reply-To: <20130916173812.5c424599@skate>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87eh8pkd53.fsf@dell.be.48ers.dk> <20130916173812.5c424599@skate>
Message-ID: <CAHXCMMLm_xxEGsAX+Yz+QQoAgozXCo_h3ftcrkbxcqz68yQ8KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter,


2013/9/16 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Peter Korsgaard,
>
> On Sun, 15 Sep 2013 23:07:04 +0200, Peter Korsgaard wrote:
>
> > I wonder if we shouldn't deprecate fortran (and objc) support and get
> > rid of them. Is there really a use case for them? Any interesting sw
> > that needs them?
>
> I have no idea. I believe Objective-C is completely useless. However, I
> believe Fortran *might* be useful for some scientific applications that
> could be used on embedded devices. But the fact that no-one ever
> complained about our Fortran support being broken (the runtime library
> was never copied to the target) is a fairly strong indication that
> nobody is using this.
>
I confirm.
I have not checked recently, but few versions ago, fortan was needed to
build opencv.


Regards,


-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130916/87308e0c/attachment.html>
