From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 18:38:12 +0200
Subject: [Buildroot] [PATCH] uclibc: Add UCLIBC_MMU_CONFIG to
 UCLIBC_SETUP_DOT_CONFIG
In-Reply-To: <CAFRkauAfAoS6JT8q1wvSFHahVLLOmTeHvddkQpECGEe-qsJ8+w@mail.gmail.com>
References: <CAFRkauAfAoS6JT8q1wvSFHahVLLOmTeHvddkQpECGEe-qsJ8+w@mail.gmail.com>
Message-ID: <20130918183812.6a068f82@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Axel, Peter,

On Wed, 18 Sep 2013 15:38:11 +0800, Axel Lin wrote:
> 2013/9/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> > Dear Axel Lin,
> >
> > On Thu, 05 Sep 2013 10:24:19 +0800, Axel Lin wrote:
> >> commit c798bec25 "uclibc: set MMU usage accordingly" defines UCLIBC_MMU_CONFIG,
> >> but forgot adding it to UCLIBC_SETUP_DOT_CONFIG. Fix it.
> >>
> >> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> >> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> >
> > Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Hi Peter,
> I sent the patch 2 weeks ago, and it got Thomas's Acked-by.
> Any chance to pick up this path as I need it for nommu build.
> If a resend or revision is necessary, just let me know.
> 
> The patch is available in patchwork:
> http://patchwork.ozlabs.org/patch/272778/

Gently-requested-to-be-applied-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
