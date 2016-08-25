From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 16:35:53 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-08-24
In-Reply-To: <CAFt09wM5VBzvUezTaOq1OH_2hu9RgDz_mLi5ywH2rJPrY7OnbQ@mail.gmail.com>
References: <20160825063045.2728F101CC4@stock.ovh.net>
 <CAFt09wM5VBzvUezTaOq1OH_2hu9RgDz_mLi5ywH2rJPrY7OnbQ@mail.gmail.com>
Message-ID: <20160825163553.643b5989@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 09:18:02 -0500, Matthew Weber wrote:

> > iputils-55828d1fef3fed7f07a... | 2  
> 
> So libgpg-error needs a dependency on gettext so that the libintl
> exists when it is statically linking.  I noticed gettext has a
> "depends on BR2_USE_WCHAR" which I'd need to pull up into libgpg-error
> and the packages which use libgpg-error.....  Any thoughts on if
> that's the right way to resolve this?  Wasn't sure if a WCHAR
> limitation on libgpg-error is the right way to go as there maybe
> packages that could use libgpg-error without libintl dependencies when
> WCHAR isn't set....

Arnout has already sent patches for this earlier today, and we already
had a lengthy discussion on this topic. See:

  http://lists.busybox.net/pipermail/buildroot/2016-August/170675.html
  http://lists.busybox.net/pipermail/buildroot/2016-August/170674.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
