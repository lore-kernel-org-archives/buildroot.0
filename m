From: Jack Cripps <jack.cripps@disguise.one>
Date: Mon, 22 Mar 2021 11:35:21 +0000
Subject: [Buildroot] Fwd: [PATCH 1/1] package/zyre: bump version to 2.0.1
In-Reply-To: <CAHFmVmW-6PVAnYV_8=233JvTLO_htDnSfbuV09CwynFjLco4XQ@mail.gmail.com>
References: <20210308122733.1404-1-jack.cripps@disguise.one>
 <87eegavqh1.fsf@dell.be.48ers.dk>
 <CAHFmVmW-6PVAnYV_8=233JvTLO_htDnSfbuV09CwynFjLco4XQ@mail.gmail.com>
Message-ID: <CAHFmVmUrLbG5xP5kHPzP0og=+38YsMf9Z0n07KM=UP--51OCYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ---------
From: Jack Cripps <jack.cripps@disguise.one>
Date: Mon, 22 Mar 2021 at 11:22
Subject: Re: [PATCH 1/1] package/zyre: bump version to 2.0.1
To: Peter Korsgaard <peter@korsgaard.com>
Cc: <buildroot@buildroot.org>, Simon Dawson <spdawson@gmail.com>


Hi,

Apologies, the zyre.mk file included in 2.0.0 or 2.0.1 does not build any
of the auto-generated, alternative language bindings for zyre ecosystem. I
don't know if this would be desired behaviour (or whether there is some way
of adding this to the zyre config file). In lieu of this, I use an custom
external package 'python-zyre' to build the ctypes python bindings as a
python package. Zyre 2.0.0 is missing the setuptools.py file from it's
python bindings hence the required bump to v2.0.1. I do not know why this
quite critical file is missing from v2.0.0.

I believe probably all buildroot versions that have zyre 2.0.0 should be
updated to 2.0.1, so 2020.02.x onwards I suppose.

Thanks,
Jack Cripps

On Fri, 19 Mar 2021 at 20:27, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Jack" == Jack Cripps <jack.cripps@disguise.one> writes:
>
>  > Version bump required due to python setup.py missing from v2.0.0 python
> bindings
>
> What does that mean exactly? How are those bindings installed and used?
> We don't seem to do anything to handle them in zyre.mk?
>
>  > Signed-off-by: Jack Cripps <jack.cripps@disguise.one>
>  > ---
>  > Backport to 2019.11.x
>
> I take it you mean 2020.11.x here? 2020.02.x and 2021.02.x also has
> zyre, so it is presumably needed there as well?
>
> --
> Bye, Peter Korsgaard
>


-- 
<http://www.disguise.one/>
Jack Cripps
Jnr Embedded SW Engineer
A : 88-89 Blackfriars Road, London, SE1 8HA
<https://www.google.com/maps/place/88-89%20Blackfriars%20Road,%20London,%20SE1%208HA>
<https://www.facebook.com/disguise.one/>
<https://twitter.com/disguise_one>
<https://www.youtube.com/channel/UCBXckvTm2VHU29BUoKJizvA>
<https://www.instagram.com/disguise_one/>
<https://www.linkedin.com/company/disguise-/>


-- 
<http://www.disguise.one/>
Jack Cripps
Jnr Embedded SW Engineer
A : 88-89 Blackfriars Road, London, SE1 8HA
<https://www.google.com/maps/place/88-89%20Blackfriars%20Road,%20London,%20SE1%208HA>
<https://www.facebook.com/disguise.one/>
<https://twitter.com/disguise_one>
<https://www.youtube.com/channel/UCBXckvTm2VHU29BUoKJizvA>
<https://www.instagram.com/disguise_one/>
<https://www.linkedin.com/company/disguise-/>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210322/8cc0b593/attachment.html>
