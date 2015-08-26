From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Aug 2015 10:01:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-08-25
In-Reply-To: <20150826063016.335E3101EE6@stock.ovh.net>
References: <20150826063016.335E3101EE6@stock.ovh.net>
Message-ID: <55DD8057.20702@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 08/26/2015 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2015-08-25

>         mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/ffe83d43fb3c38b721b9982cbb0e980e01d0ebfd/

Fixed by:

http://patchwork.ozlabs.org/patch/507916/

>       mipsel |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/95f6df0d01e4944ecd84e830e2bbd8389e1d3e3d/

Fixed by:

http://patchwork.ozlabs.org/patch/510765/

Note: I tried the pkg-config approach first, but it didn't work.

>     mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/7c0a8ec5cc17024806a541a604fa81ba71fd6336/

Nothing to worry about. The autobuilder ran out of RAM memory:

./.libs/../DerivedSources/webkitdom/.libs/libGObjectDOMBindings_la-WebKitDOMHTMLFormElement.o:
could not read symbols: Memory exhausted
collect2: error: ld returned 1 exit status

>       xtensa |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/41df0fcc37b5a807be4c4b1958823fbf36a0167b/
>          arm |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/2e9dac3c56738203fa155e24c6336ab938371f72/
>       mipsel |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/6d2dbe59233d555bd0bfe484ed36377a829baa52/
>          arc |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/7741d2c1d618ad958b7fd5b0fedd0fffe18c2700/

Nothing to worry about. Already fixed by Bernd Kuhls' series:


http://git.buildroot.net/buildroot/commit/?id=9519516a17434281f0de58179409379b48774868

http://git.buildroot.net/buildroot/commit/?id=d23c4d4f4d6148e7f33c73af86611020a61b8cbb

http://git.buildroot.net/buildroot/commit/?id=77397b1c72323b8019b94abba7ca03af1aee2c0f

Regards,

Vincent.
