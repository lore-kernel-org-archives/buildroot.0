From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Nov 2018 23:15:00 +0100
Subject: [Buildroot] [PATCH 1/1] mpv: disable static build with qt-zlib
In-Reply-To: <20181103142607.59465b91@windsurf>
References: <20181102182416.27015-1-fontaine.fabrice@gmail.com>
 <20181103142607.59465b91@windsurf>
Message-ID: <f4c48e31-b230-5fbd-80d3-1504000852e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/11/18 14:26, Thomas Petazzoni wrote:
[snip]
> It would be great if you could confirm that the same configuration
> builds properly when BR2_PACKAGE_QT_SYSTEMZLIB is used instead of
> BR2_PACKAGE_QT_QTZLIB. If that is the case, then I believe the right
> fix is to add a depends on !BR2_STATIC_LIBS to the
> BR2_PACKAGE_QT_QTZLIB option.

 Or maybe remove the QTZLIB option entirely.

 (Or maybe remove qt4 entirely :-)

 Regards,
 Arnout
