From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Nov 2012 22:11:05 +0100
Subject: [Buildroot] Qt accessibility support
In-Reply-To: <1353529923.81343.YahooMailNeo@web164605.mail.gq1.yahoo.com>
References: <1353529923.81343.YahooMailNeo@web164605.mail.gq1.yahoo.com>
Message-ID: <20121121221105.2fbcfde7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoran Djordjevic,

On Wed, 21 Nov 2012 12:32:03 -0800 (PST), Zoran Djordjevic wrote:

> Is it possible to choose somwhere in Buildroot menues, 
> exclusion/inclusion of accessibility support for Qt ? 
> As much as I understand it is matter that should be defined
> at?Qt build time (am I right ?). 
> Question doesn't relate only to accessibility, but for other
> (if any) options too.

Look at package/qt/Config.* and package/qt/qt.mk to see how we handle
options for Qt. Should be easy to extend to other options if needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
