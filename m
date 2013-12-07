From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 7 Dec 2013 21:49:05 +0100
Subject: [Buildroot] Is there any effort for Quilt integration?
In-Reply-To: <CACTZKX4jtApXWz+EJB=yDubbS9ESSpS9p0WXw9wGV7KL-n+ZJw@mail.gmail.com>
References: <CACTZKX4jtApXWz+EJB=yDubbS9ESSpS9p0WXw9wGV7KL-n+ZJw@mail.gmail.com>
Message-ID: <CAAXf6LUEP2Zo40vjEvPSbeK8vtVy2w8jX5MgHRMfz1+6YfZ=Xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Atilla,

On Thu, Dec 5, 2013 at 3:23 PM, Atilla Filiz <atilla.filiz@gmail.com> wrote:
> I have just started working with quilt and loved how it can be used for
> patch management and a mini version control scheme.
>
> Is there anyone working on Quilt support for Buildroot?
>
> Whit Quilt
> 1- The patching step will use 'quilt import' instead of 'patch' if quilt
> exists
> 2- In the output/build/package-ver directory, there will be a patches subdir
>  2.1 This way the user will be able to un-apply, re-apply and modify
> existing patches
>  2.2 The user will be able to create patches in-place, without needing to
> copy, clean and diff manually

As far as I know, noone is currently working on this.
However, the question for quilt support has been raised before, and
has been discussed on the recent Buildroot developer days. The
conclusion was that we'd be open for this when someone creates a patch
for it.
See http://elinux.org/Buildroot:DeveloperDaysELCE2013#Quilt

So, feel free to create a patch for quilt support submit it to the
list. This can then start the discussion on the details...

Best regards,
Thomas
