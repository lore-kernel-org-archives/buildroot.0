From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:41:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: bump to version
 2.19
In-Reply-To: <20200713164920.1469219-1-fontaine.fabrice@gmail.com>
References: <20200713164920.1469219-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713214110.09595ef4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 18:49:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> * fix off-by-one bug in MPD_HOST parser
> * add function mpd_lookup_replay_gain_mode()
> * identify messages with length over the buffer limit
> * support MPD protocol 0.16
>  - replay gain
> * support MPD protocol 0.19
>  - idle events "neighbor" and "mount"
> * support MPD protocol 0.20
>  - rangeid
> * support MPD protocol 0.21
>   - command "tagtypes all"
> 
> https://raw.githubusercontent.com/MusicPlayerDaemon/libmpdclient/v2.19/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmpdclient/libmpdclient.hash | 4 ++--
>  package/libmpdclient/libmpdclient.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
