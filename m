From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:32:33 +0100
Subject: [Buildroot] [PATCH v2 14/17] elf2flt: use new upstream site and
 add ARM patch
In-Reply-To: <CAAEAJfBDOu=3dQnXjOROxTNMOxq-+0o+4xv9kSRF2+S32EW+fQ@mail.gmail.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-15-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAEAJfBDOu=3dQnXjOROxTNMOxq-+0o+4xv9kSRF2+S32EW+fQ@mail.gmail.com>
Message-ID: <20160319143233.42594e30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel,

On Fri, 18 Mar 2016 18:34:15 -0300, Ezequiel Garcia wrote:

> > diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
> > new file mode 100644
> > index 0000000..c5e71db
> > --- /dev/null
> > +++ b/package/elf2flt/elf2flt.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256sum
> 
> s/sha256sum/sha256 ?

Gaah, indeed. Last minute changes are really not good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
