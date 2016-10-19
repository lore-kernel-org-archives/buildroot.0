From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 19 Oct 2016 08:17:48 +0200
Subject: [Buildroot] [Patch v3 1/2] rust-bootstrap: new package
In-Reply-To: <ee04066a-2251-60d0-78f5-3fd3e0525bf1@mind.be>
References: <1468533676-10894-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468533676-10894-2-git-send-email-eric.le.bihan.dev@free.fr>
 <2a62ef7a-1d5f-546d-0287-78cb505a0ec3@mind.be>
 <20161018204701.GA18610@itchy>
 <ee04066a-2251-60d0-78f5-3fd3e0525bf1@mind.be>
Message-ID: <20161019061748.GA24316@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-10-19 00:09:30, Arnout Vandecappelle wrote:
>
>
> On 18-10-16 22:47, Eric Le Bihan wrote:
> > Hi!
> >
> > On 16-10-16 13:27:51, Arnout Vandecappelle wrote:
> >>
> >>
> >> On 15-07-16 00:01, Eric Le Bihan wrote:
> [snip]
> >>> +RUST_BOOTSTRAP_LICENSE = Apache-2.0, MIT
> >>
> >>  Can you specify which parts or under which license?
> >
> > Rust is dual licensed (Apache-2.0 OR MIT). So, I'll change it to:
> >
> > RUST_BOOTSTRAP_LICENSE = Dual Apache-2.0/MIT
>
>  No, it should be
>
> RUST_BOOTSTRAP_LICENSE = Apache-2.0 or MIT
>
> See the example in the manual under the generic package infra [1].

Right. I should have read the manual instead of sampling packages.
The following ones currently use "FOO_LICENSE = Dual first/second":

- libsamplerate
- nettle
- freetype

I'll send a patch to make them compliant. Looking at the manual [1], I do
not see what should be used for "proprietary" or "commercial". So, for
libsamplerate, should I use "LIBSAMPLERATE_LICENSE = GPLv2+ or COMMERCIAL"?

[1] https://buildroot.org/downloads/manual/manual.html#legal-info-list-licenses

Best regards,

--
ELB
