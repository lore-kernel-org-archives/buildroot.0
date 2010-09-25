From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 25 Sep 2010 17:02:19 +0200
Subject: [Buildroot] "make menuconfig" possibly broken in git master
In-Reply-To: <1285422557.27944.15.camel@coalu.atr>
References: <AANLkTimzWbLUWA+28XdSa+28oPDHdpJnVODso_VTRv9m@mail.gmail.com>
	<1285422557.27944.15.camel@coalu.atr>
Message-ID: <AANLkTinvgudQ0ZcdoECJ8tcMHOv8aGdAUXJjz4XU0UBL@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/9/25 Lionel Landwerlin <llandwerlin@gmail.com>:
> I had this too. You have to clean your repository well.

You are correct. "make distclean" apparently doesn't clean the
repository enough,
because it wasn't until I did a fresh git clone that the issue went away.

Best regards,
Bj?rn Forsman
