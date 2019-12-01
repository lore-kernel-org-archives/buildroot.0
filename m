From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 1 Dec 2019 10:43:33 -0800
Subject: [Buildroot] [Bug 12286] Can't import gobject in python 3.8
In-Reply-To: <bug-12286-163-jol9fBu8wQ@https.bugs.busybox.net/>
References: <bug-12286-163@https.bugs.busybox.net/>
 <bug-12286-163-jol9fBu8wQ@https.bugs.busybox.net/>
Message-ID: <CAFSsvmoDRYEMwgsG1YA49=6gh-znesLQxeDo8vOBFkdB88qMhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;


On Thu, Nov 28, 2019 at 11:07 AM <bugzilla@busybox.net> wrote:
>
> https://bugs.busybox.net/show_bug.cgi?id=12286
>
> --- Comment #3 from info at hifiberry.com ---
> As Python2 support ends in less than 2 months, just disabling it on Python3
> won't really help as there should be no new software anymore that still uses
> Python2.
> What's the state of the introspection code?
>
I have a patch series here:
https://patchwork.ozlabs.org/project/buildroot/list/?series=137614

There are currently issues with patch 4/5 which causes libglib2 to not
build properly
if python3 isn't built yet for the target. There are suggestions on
how to fix the issue,
however, I do not have the time to implement the changes.

Other than that issue, I personally use gobject-introspection in my
current projects and
it works quite well! Any feedback would be appreciated!

Adam
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
