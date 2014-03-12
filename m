From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 12 Mar 2014 20:24:56 +0100
Subject: [Buildroot] [PATCH v5 1/6] libdrm: Remove xorg dependency for
	intel driver
References: <BLU0-SMTP20422ECD84A18D82671FAE4D9770@phx.gbl>
 <531F851F.40002@savoirfairelinux.com>
 <3p65vaxf8m.ln2@ID-313208.user.individual.net>
 <lo95vax104.ln2@ID-313208.user.individual.net>
 <5320096D.1020900@savoirfairelinux.com>
Message-ID: <8to6vaxn6k.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sebastien Bourdelin
<sebastien.bourdelin@savoirfairelinux.com>
wrote in news:5320096D.1020900 at savoirfairelinux.com: 

>>> xlib_pciaccess itself does not depend on xorg stuff, I was able to
>>> compile the libdrm intel driver with patch v5 without activating
>>> xorg7. 
> As far as i understand, the package XORG7 is a kind of a container which
> doesn't compile anything, it only adds global toolchain dependencies for
> all the xorg stuff.
> Did you try to build the xlib_libpciaccess with a toolchain without this
> options ?

Hi,

no, and I do not think I will try to do se because I would like to see my 
patches committed to buildroot in the nearby future;) I will post a new 
series without this patch.

Regards, Bernd
