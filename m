From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 26 Sep 2016 22:27:56 -0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-18
In-Reply-To: <CAGm1_ksU7-Hk697crn=J0zACDUSoHO0CBJ6JWCAOra8_MatzMA@mail.gmail.com>
References: <20160919063029.C1AD5103A10@stock.ovh.net>
 <CAGm1_kv+dJGG1z9Uj=-njXzJfVKyGWs-wRG_UwQ2tgy27jW9sg@mail.gmail.com>
 <CAGm1_ksU7-Hk697crn=J0zACDUSoHO0CBJ6JWCAOra8_MatzMA@mail.gmail.com>
Message-ID: <CANxTyt6ztc9rxLfrT01WtxG_hx9cv=Cuo0F8edQdXSX3_qvkhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yegor,

On Mon, Sep 19, 2016 at 5:48 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:

>> Looks as we need a host python-docutils package or setup.py must be
>> patched to provide synopsis and long_description without docutils.
>
> Actually we need both host and target variants. Because some Python
> programs like circus will check the dependencies at run-time and fail,
> if docutils is not installed on the target.
>
> Danomi could you provide such a patch?
>
> Yegor

Sorry, guys - I didn't check email for a couple weeks, and missed all
of this python-docutils business.  I see that it's all fixed up now.
Thanks for covering for me!

Danomi -
