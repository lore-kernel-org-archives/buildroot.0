From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 9 Aug 2016 06:14:44 +0200
Subject: [Buildroot] [PATCH 0/9] Introducing service
 supervision/management with s6
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160809041444.GQ22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,
Eric Le Bihan wrote,

> Hi!
> 
> This series provides all the packages for programs and libraries to build an
> embedded system with service supervision and management using s6 from
> http://skarnet.org.
> 
> Note that these packages only provide the mechanism for supervising/managing
> services using s6, not the policy. Packages to provide a policy suitable for
> Buildroot-based embedded systems, using s6 as init (instead of SysV or
> systemd), will be provided later. An example is available in the buildroot-s6
> demo project [1].

Is there a reason s6 series depends on glibc or musl?
I once played with s6, but was scared about pre-configring for all
architectures. Do you think your patch to skalibs has any chance to
be upstreamed?

best regards
 Waldemar
