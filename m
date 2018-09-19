From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 19 Sep 2018 08:54:40 -0500
Subject: [Buildroot] [PATCH 1/8] libselinux: bump to version 2.8
In-Reply-To: <20180919154536.21b562b2@windsurf>
References: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
 <20180919154536.21b562b2@windsurf>
Message-ID: <CANQCQpayj1T0X8f3G8vsa_ag13OUVr3UbTk76ef95kVMNOUJKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Sep 19, 2018 at 8:46 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Adam, Matt,
>
> On Sun, 16 Sep 2018 20:45:59 +0200, Fabrice Fontaine wrote:
> > - Remove second patch (already in version), see
> >   https://github.com/SELinuxProject/selinux/commit/b24980ec07af66c4b419f8053aa65e97b36e558d
> > - Update third patch
> > - Pass SHLIBDIR=/usr/lib because by default it is set to /lib and LIBDIR is set to
> >   $(PREFIX)/lib (with PREFIX=/usr)
> > - Add hash for license file
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Since you are among the users of the SELinux support in Buildroot, it
> would be great if you could give a test to this patch series.
>

Will do.

Matt
