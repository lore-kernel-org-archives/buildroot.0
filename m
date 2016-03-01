From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 10:18:58 +0100
Subject: [Buildroot] [PATCH/next v9 01/28] package/freeswitch: new
 package
In-Reply-To: <m1pfqcxu66.ln2@ID-313208.user.individual.net>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
 <1456586838-21197-2-git-send-email-bernd.kuhls@t-online.de>
 <20160229222127.27db4013@free-electrons.com>
 <m1pfqcxu66.ln2@ID-313208.user.individual.net>
Message-ID: <20160301101858.70ab1ec8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Tue, 01 Mar 2016 07:22:14 +0100, Bernd Kuhls wrote:

> this is weird, using the same defconfig I can compile freeswitch without 
> problems. Could you please pastebin your whole freeswitch configure log 
> so I can compare it with mine?

Are you testing with all freeswitch patches applied or just patch
01/28 ? I am testing with just patch 01/28 applied, which can be a
difference from your testing scenario.

I did the test again, with PATCH 01/28 applied on top of the current
next branch. You can find the exact commit I've tested at
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=freeswitch.

And I still get the same build failure (with the defconfig I provided
yesterday). The entire build log can be found at:

http://free-electrons.com/~thomas/pub/freeswitch.log

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
