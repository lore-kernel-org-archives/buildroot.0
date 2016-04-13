From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Apr 2016 23:02:46 +0200
Subject: [Buildroot] [PATCH 4/4] board/minnowboard-max: Add a X-based
	graphical defconfig
In-Reply-To: <570D87A6.3030907@mind.be> (Arnout Vandecappelle's message of
 "Wed, 13 Apr 2016 01:41:26 +0200")
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-5-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D87A6.3030907@mind.be>
Message-ID: <87y48hi5mx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/12/16 07:29, Ezequiel Garcia wrote:
 >> This commit adds a new defconfig to build a X-based
 >> graphical system for the MinnowboardMax board.
 >> 
 >> * The 'openbox' windows manager is chosen because it's simple
 >> and lightweigth.
 >> 
 >> * Basic X apps are enabled (such as xrandr, xterm), so we
 >> can at least get a console and change video mode.
 >> 
 >> * ALSA default configuration is provided, so HDMI audio
 >> works out-of-the-box.
 >> 
 >> * Systemd is chosen as the init system because... you know ;)

 >  I'm not sure I agree with this one. Even though I like systemd
 > myself, I really don't think it belongs here.

Agreed.

-- 
Bye, Peter Korsgaard
