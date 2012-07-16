From: Alex Bradbury <asb@asbradbury.org>
Date: Mon, 16 Jul 2012 10:54:24 +0100
Subject: [Buildroot] Systemd update
In-Reply-To: <20120716114155.3b5f715f@skate>
References: <CADiAo4KdxANfaB4xZyWBZe_w+y-p9UTJ1FVjcX7=KgRHkinVHQ@mail.gmail.com>
 <CALR4fEKHpNy-TyCBWigS-9gLySp_d3Amy_N=xZqSWbif-9H97A@mail.gmail.com>
 <CADiAo4KwLhtG-ZpaBBSRQAeDBjKW9XCxAm00ZHUKw2NF97dEMg@mail.gmail.com>
 <CALR4fE+nyZZXCGVOSRJM=rir4eYE4L0_Y7K+KZE5wvmUL8dFTA@mail.gmail.com>
 <CA+wH294OCgYwtavEVYFUaDv1zpPPcXxEc8nDr4K_fkh2ydo9gw@mail.gmail.com>
 <20120716114155.3b5f715f@skate>
Message-ID: <CA+wH295E5hVaS7PZvBZ+jqOdPMcMEen4g2+dyUnx6Ep9P-8ucw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 July 2012 10:41, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 16 Jul 2012 10:32:43 +0100,
> Alex Bradbury <asb@asbradbury.org> a ?crit :
>
>> I'm interested in buildroot + the Raspberry Pi also (I'm currently
>> responsible for the official Debian wheezy based images). You might
>> want to have a look at
>> https://github.com/nezticle/RaspberryPi-BuildRoot and feel free to
>> contact me off-list if you're having problems building and booting a
>> kernel (or drop by #raspberrypi-dev on Freenode).
>
> Do you think it would be possible to submit the necessary patches to
> the official Buildroot, instead of maintaining a fork? It will also
> make it easier for you to maintain the support for Rasberry Pi if it is
> in the mainline Buildroot version.
>
> I am definitely interested in seeing more board/SoC-specific support in
> Buildroot.

That particular patchset is not my own work, but yes - I would also
like to see something like this submitted upstream and have suggested
to the author he does so. Now we're about to get the next Wheezy
release out the door (moving to armhf thanks to the Raspbian folks)
I'm hoping I'll be able to spend some time with buildroot.

Alex
