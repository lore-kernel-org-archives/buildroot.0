From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 27 Sep 2018 09:00:31 -0500
Subject: [Buildroot] [PATCH v2,1/8] libselinux: bump to version 2.8
In-Reply-To: <20180921205013.21829-1-fontaine.fabrice@gmail.com>
References: <20180921205013.21829-1-fontaine.fabrice@gmail.com>
Message-ID: <CANQCQpYEg6yHKexL9Y7WJRDqiD3Bm080x7j7G56__DYKoU=aGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Fri, Sep 21, 2018 at 3:50 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> - Remove second patch (already in version), see
>   https://github.com/SELinuxProject/selinux/commit/b24980ec07af66c4b419f8053aa65e97b36e558d
> - Update third patch
> - Pass SHLIBDIR=/usr/lib because by default it is set to /lib and LIBDIR
>   is set to $(PREFIX)/lib (with PREFIX=/usr)
> - Use DESTDIR=$(HOST_DIR) instead of PREFIX=$(HOST_DIR) to install host
>   variant
> - Remove libselinux.so symbolic link for host variant (not needed)
> - Add hash for license file
>

I've reviewed and build tested this 2.8 series and it looks good.
I've handed off images for runtime testing and will reply back with my
tested by once those pass.

Thanks,
Matt
