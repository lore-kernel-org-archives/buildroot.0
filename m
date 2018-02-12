From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 12 Feb 2018 13:20:47 -0500
Subject: [Buildroot] [RFC 0/2] Qt5 bump latest version to 5.10.0
In-Reply-To: <6E93C276-D7E9-4E27-B3DD-44FA8626F542@ecagroup.com>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <6E93C276-D7E9-4E27-B3DD-44FA8626F542@ecagroup.com>
Message-ID: <20180212182047.zuzytfyez3it4nwh@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Sun, Feb 11, 2018 at 10:11:18PM +0000, Julien CORJON wrote:
> Ga?l,
> 
> Le 11 f?vr. 2018 ? 17:13, Ga?l PORTAY <gael.portay at savoirfairelinux.com<mailto:gael.portay@savoirfairelinux.com>> a ?crit :
> 
> I also noticed this bug last week when I was trying to make qt5wayland work on top of Mesa for an i.MX6 and made a report here : https://bugreports.qt.io/browse/QTBUG-66233
> 
> You should probably extend this bug report with others modules (multimedia and WebKit)
>

Thanks to have opened a bug in Qt tracker. I added a comment in your
ticket to tell that the bug exists in qtwebkit and qtmultimedia.

> I?ll review this fix until qt community fix this bug in pro files.
> 

Thanks.

I sent the patch series[1]. Here for qtwayland[2].

But I cannot see in patchwork the patches for qtwebkit and
qtmultimedia... :/

> Regards,
> 
> Julien
> 

Regards,
Gael

[0]: https://patchwork.ozlabs.org/cover/871877/
[1]: https://patchwork.ozlabs.org/patch/871878/
