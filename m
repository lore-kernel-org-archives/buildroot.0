From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 00:12:47 +0100
Subject: [Buildroot] [PATCH v2 10/18] erlang-p1_stun: bump to version
 0.9.0
In-Reply-To: <CA+-urNRQdWeYMt4RxONJFMDTBV9EtcD_+TBV3G-PismHVUhhOA@mail.gmail.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-11-git-send-email-fhunleth@troodon-software.com>
 <20160220233043.2be4fa0c@free-electrons.com>
 <CA+-urNRQdWeYMt4RxONJFMDTBV9EtcD_+TBV3G-PismHVUhhOA@mail.gmail.com>
Message-ID: <20160221001247.1f188600@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Feb 2016 18:09:20 -0500, Frank Hunleth wrote:

> Yes, I generally have the same preference. In the Erlang world, the
> style is to use underscores since module names can be represented as
> atoms. In theory, you can quote atoms if you want them to have
> hyphens, but it doesn't look pretty. In the end, I don't think that it
> bothers me either way, so I'm happy to leave it as is.

Ok, fine.

> >>  config BR2_PACKAGE_ERLANG_P1_STUN
> >> -     bool "erlang-p1-stun"
> >> -     select BR2_PACKAGE_ERLANG_P1_TLS
> >> +     bool "erlang-p1_stun"
> >> +     select BR2_PACKAGE_ERLANG_FAST_TLS
> >
> > Build testing has shown that BR2_PACKAGE_ERLANG_FAST_TLS was not the
> > proper dependency, and instead keeping BR2_PACKAGE_ERLANG_P1_TLS was
> > the right solution. Could you double check why you switched to
> > fast_tls ?
> 
> This was a mistake on my part. I fixed it in a patch that I hadn't
> sent to the list, so thanks for fixing that for me.

So, is the fast_tls package still useful?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
