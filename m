From: Christian Stewart <christian@paral.in>
Date: Sun, 2 Aug 2020 09:00:02 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <20200802125758.3ce2215d@gmx.net>
References: <20200801203749.424827-1-christian@paral.in>
 <20200801233410.6ec574ce@gmx.net>
 <CA+h8R2qz5aRa5DrkXcN+0Cca_vysEUdLQK+nAN1WMNg3dR08yA@mail.gmail.com>
 <CA+h8R2oApXa_RjDPxNXK65S6SNZXgyXvBnEBUy3RuR9BZA=xNQ@mail.gmail.com>
 <20200802125758.3ce2215d@gmx.net>
Message-ID: <CA+h8R2p1Enr-B=ALHQBCQCC01Di9U2dn7ftiNxdJ2QL9T3sPzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Peter,

On Sun, Aug 2, 2020 at 3:58 AM Peter Seiderer <ps.report@gmx.net> wrote:
> Did only a quick test some weeks ago, trying the IBSS mode and to get wifibroadcast
> to work (both did not work out as far as I remember, so switched to some other cards)...

I have a rtl8821au card in the mail to test with (odroid USB module).

By all means, if the aircrack fork will fix these features, then let's
switch it.

> > See: https://github.com/paralin/buildroot/commit/af8d30846e71e378fdcdb632bbbbfe0aaf7bb669
>
> Will take a look at it (if I find some spare time ;-)) and try it out...

Appreciated, perhaps you (or someone else who knows) could have a look
at the depmod errors I was seeing with the fork if you have a moment.

Best regards,
Christian
