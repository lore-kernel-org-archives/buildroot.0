From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 13 Feb 2018 11:35:53 -0500
Subject: [Buildroot] [RFC 0/2] Qt5 bump latest version to 5.10.0
In-Reply-To: <20180213152300.w52qim25v3h3h34u@archlinux>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180212222046.galqtm4hl5pnzr5t@archlinux>
 <20180213152300.w52qim25v3h3h34u@archlinux>
Message-ID: <20180213163553.cbu7khpnf4b243e7@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 13, 2018 at 10:23:00AM -0500, Ga?l PORTAY wrote:
> ...
>
> After investigation, qtwebengine uses the pkg-config wrapper to get
> libs/cflags for both target and host package...
> 
> That is why ninja is trying to link target libraries for an host tool...
> 
> I guess qtwebengine is broken for cross-compile for now :/
>

Two more things...

	* Qt has release 5.10.1 yesterday
	* A issue was closed in Qt tracker[1] and a workaround is merged
	  in 5.10.1[2]

I will try out this new version.

[1]: https://bugreports.qt.io/browse/QTBUG-65079
[2]: https://codereview.qt-project.org/#/c/214623/
