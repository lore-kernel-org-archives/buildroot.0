From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jun 2015 16:12:02 +0200
Subject: [Buildroot] [PATCH 1/1] libarchive: add hash and enable lzma
 support
In-Reply-To: <CALoSW65dVmXMRYcbmLDutTv1ropaYg15i2Vjd1DmGpabs39ABA@mail.gmail.com>
References: <1435330918-25695-1-git-send-email-nimaim@gmail.com>
 <20150626212800.60e62745@free-electrons.com>
 <CALoSW65dVmXMRYcbmLDutTv1ropaYg15i2Vjd1DmGpabs39ABA@mail.gmail.com>
Message-ID: <20150627161202.7d65ae10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nimai Mahajan,

On Fri, 26 Jun 2015 15:32:52 -0400, Nimai Mahajan wrote:

> > In his review, Arnout asked you to pass --with-lzma in this case, but
> > you forgot to do it. So I've that and applied. Thanks!
> 
> Thanks, I had seen that actually but I was trying to be consistent with the
> other options there, which specified the package dependency (i.e. zlib)
> followed by the configure options if it wasnt selected (i.e. without-zlib).
> But point taken.

In general, when Arnout makes a suggestion, he is right :-)

In this specific case, the rest of libarchive.mk is in fact not good,
and should be changed to explicitly pass --with-<foo>.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
