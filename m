From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 23 Jan 2020 07:53:33 +0100
Subject: [Buildroot] [PATCH 00/26] Add hash for license file in some
 packages
In-Reply-To: <77188e69-5d04-d5b6-8a5a-3965d1bbce9e@mind.be>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
 <15578e10-adba-7ca7-924b-ea2abecd1012@mind.be>
 <77188e69-5d04-d5b6-8a5a-3965d1bbce9e@mind.be>
Message-ID: <CAEyMn7YDgWsW_yyZLdVvV2HGPgLXdV5g47FvkXBOVp_O+=ZKbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am Mi., 22. Jan. 2020 um 23:41 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 22/01/2020 23:32, Arnout Vandecappelle wrote:
> >
> >
> > On 22/01/2020 09:16, Heiko Thiery wrote:
> >> This is a bunch of patches that adds the license file hashes.
> >>
> >> The packages are tests with: make <pkg>-legal-info
> >
> >  Series applied
>
>  Forgot to mention: in a few of them, I also changed the spaces/tabs in the
> existing hash to be consistent (aligned) with the hash you added.

I wil take care the next time.

Thank you

>  Regards,
>  Arnout
>
> >, except for the autoconf-archive one because that failed the
> > 'make host-autoconf-archive-legal-info' test...
> >
> >>>> host-autoconf-archive 2019.01.06 Collecting legal info
> > ERROR: COPYING has wrong sha256 hash:
> > ERROR: expected: ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6
> > ERROR: got     : e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195
> >
> >
> >  Can you check that?
> >
> >  (Marked it as Changes Requested in patchwork)
> >
> >  Regards,
> >  Arnout
> >
