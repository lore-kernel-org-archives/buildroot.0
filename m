From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 22:21:38 +0200
Subject: [Buildroot] [PATCH v7 20/22] squashfs: Add xattr support
In-Reply-To: <CANQCQpZ=b1oNNCk0viuBpjw9nw9KXMja7q4Z0qGi0Vk3kTj8NA@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-21-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150706121602.402373fc@free-electrons.com>
 <CANn-YGTqC=bhPjybxvfbH9sVZ2Vfa6xrvKaRkVOAvKTdCV3byA@mail.gmail.com>
 <20150710222353.637179e9@free-electrons.com>
 <CANQCQpZ=b1oNNCk0viuBpjw9nw9KXMja7q4Z0qGi0Vk3kTj8NA@mail.gmail.com>
Message-ID: <20150715222138.41336c86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Sat, 11 Jul 2015 12:12:36 -0500, Matthew Weber wrote:

> > No problem. However, I'm curious to know what is your use case: you are
> > preparing a SquashFS image on your target?
> 
> We build a x86 SELinux enabled qemu target that repackages our target
> filesystems with pre-labelled security attributes.  Sort of a sandbox
> approach.

Why is this needed? Can you generate those security attributes at build
time?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
