From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:12:17 +0200
Subject: [Buildroot] [PATCH v2] dependencies: Reject gcj in
 BR2_NEEDS_HOST_JAVA check
In-Reply-To: <XnsA38CD71E7C36AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1408182278-5026-1-git-send-email-bernd.kuhls@t-online.de>
 <20140817210247.4f01527d@free-electrons.com>
 <XnsA38CD71E7C36AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140817211217.11bad190@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 17 Aug 2014 21:08:49 +0200, Bernd Kuhls wrote:

> > Note however that I'm not sure it's going to immediately fix the
> > autobuilder issues: build will continue to fail, only earlier, unless
> > the autobuilder script used by Peter is fixed.
> 
> True of course, autobuilder will still fail, the same is valid for users 
> trying to build xbmc using buildroot with gcj installed on the host. At least 
> it fails an hour or so earlier now and with a clear error message ;)

Indeed :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
