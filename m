From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2016 16:45:11 +0200
Subject: [Buildroot] [PATCH v2] python-pyqt5: new package
In-Reply-To: <ffa5e5ad-a682-fb7e-98c7-3e14a7bdef43@mind.be>
References: <20160819134225.1490-3-develop@manuel-voegele.de>
 <20160823092606.1462-1-develop@manuel-voegele.de>
 <20160920211456.7dc36850@free-electrons.com>
 <ffa5e5ad-a682-fb7e-98c7-3e14a7bdef43@mind.be>
Message-ID: <20160927164511.28f43ff9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 22:54:08 +0200, Arnout Vandecappelle wrote:

>  Well, since the main symbol depends on !BR2_PACKAGE_QT, you would expect either
> a comment that explains that, or you would expect the other comments to be
> hidden. So to me it makes sense to have that depends for the comment. Otherwise,
> you go and enable wchar, NPTL, C++, dynlib, you come back, and hey presto the
> comment disappears but the package still can't be selected.

Indeed. Thanks for correcting me on this. Fixed in
https://git.buildroot.org/buildroot/commit/?id=b62fdfdc274e592675a4894b893841991e72c913.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
