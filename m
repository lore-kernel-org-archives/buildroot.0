From: Anders Darander <anders.darander@gmail.com>
Date: Wed, 20 Apr 2011 07:48:03 +0200
Subject: [Buildroot] initramfs, busybox init, switch_root and ARM
In-Reply-To: <20110420000445.32c24327@surf>
References: <BANLkTi=8bAcdFNgo8MXaiVHnSr8CTqrt-w@mail.gmail.com>
	<20110420000445.32c24327@surf>
Message-ID: <BANLkTin5GRDOQHiWi9ZTTOC5uzjT5FtUtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 20, 2011 at 00:04, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 18 Apr 2011 19:31:52 +1000
> Thomas Koster <tkoster@gmail.com> wrote:
>> In either case, I expect to be using busybox and uClibc throughout
>> (that is, I won't be using GNU libc or a debian root unless I hit a
>> major roadblock with uClibc). One day I might try compiling a java or
>> mono runtime for it but that is over the horizon.
>
> Ouch, Java and Mono runtime are probably not the easiest things to get
> running on non-x86 platforms. Definitely possible, but probably not
> easy.

Well, it can be a little bit tricky, but it's manageable.

1 - 1 1/2 year ago, I got a few JavaVM's up and running (at least one
of them were in buildroot at that time). Unfortunately, our Java-guy
insisted that GNU's Classpath was unsuitable for our project; thus, we
had to change the JavaVM. Ultimately, we used the PhoneME JavaVM (with
the advanced profile, not the feature profile) up and running. At that
time, it required a few patches to the build and configuration
scripts.

This was all done for an ARM9-platform (at91sam9260).

/Anders
