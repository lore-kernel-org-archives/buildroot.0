From: Ed Spiridonov <edo.rus@gmail.com>
Date: Sat, 10 Oct 2020 09:43:40 +0300
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <CACm0Nn0wB-CdiqoJLFz0=pbiA2XF5qAgpShxjzFchJsAf-ZN9A@mail.gmail.com>
References: <20200511223108.4184-1-edo.rus@gmail.com>
 <20200515221042.011b8d33@windsurf.home>
 <CACm0Nn2ZFPuHKQoCh5pdakeHh80q-4nzt1umH0A5Rbon_ktgZw@mail.gmail.com>
 <20200518071508.5c8f134c@windsurf.home>
 <CACm0Nn0wB-CdiqoJLFz0=pbiA2XF5qAgpShxjzFchJsAf-ZN9A@mail.gmail.com>
Message-ID: <CACm0Nn2KLVQhNvfanv1MB79i=ZmVCsXFmEP_NEockfQ-4cBKOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm still waiting for some reply.


On Fri, Jul 10, 2020 at 9:39 PM Ed Spiridonov <edo.rus@gmail.com> wrote:
>
> On Mon, May 18, 2020 at 8:15 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > There are however some packages where we add explicit sub-options, for
> > various reasons, but that is not the general case.
>
> 1. Is eliminating the explicit choice of a crypto backend required for
> the patch approval?
> 2. Is it ok to provide Mbed TLS as the default choice?
