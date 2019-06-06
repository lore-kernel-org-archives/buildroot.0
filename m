From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Jun 2019 20:48:28 +0200
Subject: [Buildroot] [PATCH v4] package/exiv2: cleanup options and
 licenses
In-Reply-To: <20190606151549.GA2560@scaer>
References: <20190605134957.27400-1-nicolas.serafini@sensefly.com>
 <20190605234535.1abf3c33@gmx.net>
 <2a9e28d2-1dfc-5a66-e0f4-16241adca391@mind.be> <20190606151549.GA2560@scaer>
Message-ID: <db2a5114-2e1e-e88a-2f6c-20cd7af9bb0e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/06/2019 17:15, Yann E. MORIN wrote:
>>  That said, it doesn't really hurt to have a legacy entry, so let's add it after
>> all.
> We did not add such a legacy entry for the Qt5 license drop, there is no
> reason to add one here either.

 For qt5, there was no Config.in option to which we could apply legacy. There
was only the inverse (BR2_PACKAGE_QT5BASE_LICENSE_APPROVED) so we'd have to
trigger legacy in case that option was *not* enabled, which isn't possible.

 I repeat: it doesn't hurt to add a legacy entry, and it may help someone who
thought that they could use the Buildroot exiv2 package for the thing for which
they had a commercial license.

 Regards,
 Arnout
