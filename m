From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 27 Aug 2017 11:15:55 -0400
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
	package
In-Reply-To: <7F016C7D-1A3D-4B5E-9E0D-F575D0976265@openadk.org>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
 <20170224092549.2c560db3@free-electrons.com>
 <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
 <20170227150637.ljo2c6dv3izstddn@tarshish>
 <20170227232240.GB2535@tungsten.ozlabs.ibm.com>
 <1502794041870-173505.post@n4.nabble.com>
 <1502952247260-173614.post@n4.nabble.com>
 <346fcaef-6d03-4d57-c749-da966016d401@mind.be>
 <CAFSsvmq8o3QVkogQ3=2=0BK20nZyUecy_hHLsc+XmuSJJYavTA@mail.gmail.com>
 <2b5ed9ae-1477-0c8c-ff7d-440cc60d75a9@mind.be>
 <CAFSsvmr9ZWp8yh+ve88RDUsBQS9PxgZRWTjAkotaECQ13wNeJg@mail.gmail.com>
 <7F016C7D-1A3D-4B5E-9E0D-F575D0976265@openadk.org>
Message-ID: <CAFSsvmph+b566FHd4_TgXcrN3vsOrABJd6WT+vnt=WUGio3xTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 27, 2017 at 1:11 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> Hi,
>
>> I highly doubt that considering OE/Yocto uses uclibc as well as glibc.
>> They even
>> have a bunch of patches to get SystemD working with uclibc.
>
> OE no longer supports uclibc/uclibc-ng.
> Yocto just seems to carry an old recipe for uclibc.
> Latest release of uClibc-ng and systemd no longer requires any patches, so this shows how old the uclibc-ng support in OE might be, if there are still leftovers.
> best regards
>  Waldemar
Ah fair enough.  Either way, using qemu, it hopefully *should* work
with uclibc.  Thanks for the info on uclibc in OE! It's been a while
since I was in that game! :)

Adam
