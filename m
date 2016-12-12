From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 21:14:47 +0100
Subject: [Buildroot] [PATCH v13 1/8] policycoreutils: new package
In-Reply-To: <CAKGmAFpnpdg4OiAzQXZyx1KSf5Kn6s-6JmPwJyExxRVRY+Kz5Q@mail.gmail.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <20161210155912.2fb05507@free-electrons.com>
 <CAKGmAFpnpdg4OiAzQXZyx1KSf5Kn6s-6JmPwJyExxRVRY+Kz5Q@mail.gmail.com>
Message-ID: <20161212211447.1a67143d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 13:28:04 -0600, Bryce Ferguson wrote:

> > Also, could you please have a look at what I answered to:
> >
> >   [PATCH v13 4/8] util-linux: selinux, audit, and pam support
> >
> > and look at the alternative proposals I made:
> >
> >   https://patchwork.ozlabs.org/patch/703332/
> >   https://patchwork.ozlabs.org/patch/703333/  
> 
> I will perform a test build with these patches and provide tested-by
> feedback.  I think we will want to use these patches instead of [PATCH v13
> 4/8].  So, to confirm, I will remove that patch completely as yours will
> supersede it, correct?

Yes, that's the idea. Thanks for the feedback.

Also, I'm on IRC #buildroot, usually starting from 9/9:30 PM CET, which
should conveniently fall into the afternoon for you. It would be great
if a few folks interested in SELinux in Buildroot on your side could be
on IRC so we can quickly exchange on how to move forward with this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
