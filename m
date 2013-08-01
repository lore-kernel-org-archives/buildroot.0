From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 1 Aug 2013 07:54:33 +0100
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <20130731191415.545f7dff@skate>
References: <20130731191415.545f7dff@skate>
Message-ID: <CAHt8ZCMACE5Y3QTH+_o-y5CMCcPjOsOEcTYETLx0RgaHRYaMJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31 July 2013 18:14, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> http://patchwork.ozlabs.org/patch/165674 [RFC,1/2] Add configuration item for custom JavaScript install path
> http://patchwork.ozlabs.org/patch/165675 [RFC,2/2] Use JavaScript install path from configuration during package installation

These can be discarded now, as I have no intention of working on them further.

> http://patchwork.ozlabs.org/patch/213384 [RFC] Fix avr32 build using internal toolchain

No longer relevant, as uClibc 0.9.31 support has now been removed from
Buildroot. Can be discarded.

> http://patchwork.ozlabs.org/patch/236409 udev: fix avr32 and microblaze build failures

I haven't noticed any avr32/microblaze udev autobuild failures for a
while... I suggest that this patch be discarded.

> http://patchwork.ozlabs.org/patch/238366 [RFC] permit menu customization

This doesn't adequately solve the problem that it sets out to solve;
can be discarded. (Although I do think this is still an area in which
Buildroot could be improved.)

Simon.
