From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Sep 2017 09:04:07 +0200
Subject: [Buildroot] [PATCH] libmbim: add udev as optional feature
In-Reply-To: <CAAP7ucKx_1yLVfsu-tN6exoYXh6ZJHpgS26_TJs4mUz41NL2JA@mail.gmail.com>
References: <20170906212809.18889-1-aleksander@aleksander.es>
 <20170906234741.63deeb81@windsurf.lan>
 <CAAP7ucKx_1yLVfsu-tN6exoYXh6ZJHpgS26_TJs4mUz41NL2JA@mail.gmail.com>
Message-ID: <20170907090407.3bd35ad5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Sep 2017 08:05:32 +0200, Aleksander Morgado wrote:

> Speaking of which, is there any way I can get CC-ed to changes done in
> either libqmi, libmbim or modem-manager? I wouldn't mind to review
> those.

Add yourself to the DEVELOPERS file for those packages. This way:

 * You will be Cc'ed when patches are sent,
   because ./utils/get-developers on patches touching those packages
   will return your e-mail address

 * You will be notified when http://autobuild.buildroot.org detects
   build failures for those packages.

If you're interested, just send a patch adding you to the DEVELOPERS
file.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
