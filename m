From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 14 Sep 2007 11:29:13 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lm-sensors
In-Reply-To: <12670634.post@talk.nabble.com>
References: <20070901180109.C927EA5D29@busybox.net>
	<12670634.post@talk.nabble.com>
Message-ID: <20070914092913.GA26234@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 14, 2007 at 01:15:13AM -0700, Hebbar wrote:
>
>Hi aldot,

Hi Gururaja
>
>  make mklibs fails for lm-sensors because of missing lib libsensors.so.3.
>When i searched i actually found it in $(LM_SENSORS_DIR)/lib/ folder
>symbolically linked to libsensors.so.3.1.4. so i think we need to copy it
>from here to root/usr/lib directory as the sensors binary is placed there.

Can you send a tested patch, please?

TIA,
