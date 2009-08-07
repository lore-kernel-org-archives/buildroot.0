From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 7 Aug 2009 07:22:28 +0200
Subject: [Buildroot] [Bug 331] Update MPlayer to version 1.0rc2
In-Reply-To: <4A7B6D2A.8020206@atmel.com>
References: <bug-331-163@https.bugs.busybox.net/>
	<20090727151733.33260777EC@busybox.osuosl.org>
	<4A7B6261.2030509@atmel.com> <4A7B6D2A.8020206@atmel.com>
Message-ID: <20090807072228.092c0837@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 07 Aug 2009 01:54:18 +0200
Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:

> Ulf Samuelsson skrev:

<snipp>

> Could this mean that OE uses a fixed point MP3 decoder
> while Buildroot mplayer uses a floating point decoder?
> 

Is MPlayer compiled with libmad support and is libmad used as audio
codec?

Please post the entire output from a playback, I use
a /etc/mplayer.conf to override some basic stuff.

-- 
Best regards,
Hans-Christian Egtvedt
