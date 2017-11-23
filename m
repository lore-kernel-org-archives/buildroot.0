From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 17:39:12 +0100
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <CAAkeqgUcbovvL_UdE998gZw2OtpTVywB4BerE=qOUXswc6+1mQ@mail.gmail.com>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
 <20171122041747.11363-1-yurovsky@gmail.com>
 <20171122213336.52a3e196@windsurf.lan>
 <CAAkeqgXEXtnppmJVrfRgf_uC3CeX4TunJS-CQ+=sRG+ZBR+-Ag@mail.gmail.com>
 <20171122224412.1543e00d@windsurf.lan>
 <CAAkeqgVVYW4BZ6tUH20Guxdgz3qay6D4nj+Jz9F5eT6Kn-Ygjg@mail.gmail.com>
 <20171123092152.0f0fac4a@windsurf.lan>
 <CAAkeqgUcbovvL_UdE998gZw2OtpTVywB4BerE=qOUXswc6+1mQ@mail.gmail.com>
Message-ID: <20171123173912.5476a17c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Nov 2017 08:33:40 -0800, Andrey Yurovsky wrote:

> > OK, thanks for the explanation! Is this dependency new in 0.2, or it
> > was already needed for the current 0.1.1 version of RAUC ?  
> 
> It was there in 0.1.1 as well, unfortunately I missed it when I sent
> the original patch because my systems had mksquashfs available and I
> didn't catch this until later so I was hoping to correct it now. The
> 0.2 changes are described here:
> https://github.com/rauc/rauc/blob/master/CHANGES and are mainly bug
> fixes and minor (though certainly worthwhile) improvements.

OK. Then we need two separate patches:

 - One that adds the host-mksquashfs dependency, which we will push to
   the master branch (it is a fix)

 - One that bumps rauc to 0.2, which we will push to the next branch
   (we're approaching the release, so we only accept fixes for the
   master branch).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
