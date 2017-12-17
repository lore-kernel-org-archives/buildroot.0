From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Dec 2017 12:56:00 +0100
Subject: [Buildroot] [PATCH 3/3] package/vlc: switch to libupnp-1.8
References: <20171214073134.28696-1-bernd.kuhls@t-online.de>
 <20171214073134.28696-3-bernd.kuhls@t-online.de>
 <CAPi7W81zkH=n-1yXvuCri+99H7WGvQM5Gv9BbKa6Vj7Bt027rA@mail.gmail.com>
 <a91f21b1-8503-167f-11ce-83ab99b98498@t-online.de>
 <CAPi7W81GGiGTOWqG3GeK6CRpYAP9gdLZnyGXLHQ1UJQ76mzfZA@mail.gmail.com>
 <CAPi7W8191mtTX135inFys4s0U9+hfvkuN0PjSQ0PzKc+aGgLgQ@mail.gmail.com>
Message-ID: <gj2igexsnk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 17 Dec 2017 12:39:47 +0100 schrieb Fabrice Fontaine:

> Dear all,
> 
> Finally, the issue was in vlc, I will send a patch ASAP.

Hi,

you can use the patch from Debian: https://github.com/mrjimenez/pupnp/
issues/63#issuecomment-352250328

I can confirm that vlc will be fixed with these two patches:

https://sources.debian.org/src/vlc/2.2.8-2/debian/patches/0012-Fix-
UpnpEventPtr-typedef-for-versions-before-1.8.0.patch/

http://git.videolan.org/?
p=vlc.git;a=patch;h=f9c5a343f1a8cad9c2c153f9c05e4e7201675a43

Regards, Bernd
