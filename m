From: Michael Rommel <rommel@layer-7.net>
Date: Sat, 21 Sep 2013 13:55:08 +0200
Subject: [Buildroot] Is ther an X screen saver/locker?
In-Reply-To: <20130921094316.GA30205@zuhnb712.ap.bm.net>
References: <20130921094316.GA30205@zuhnb712.ap.bm.net>
Message-ID: <3B61DD45-061A-4263-AE39-2C20C57A406F@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Woody,

there is a program called xautolock (not yet in BR), which is fairly small and you can call an external program as screensaver, e.g. feh which is included in buildroot already.

It can be found here: http://www.ibiblio.org/pub/Linux/X11/screensavers/xautolock-2.2.tgz

I have not tried to compile it, as I am not very familiar with X programs under buildroot. It seems to need xmkmf, which I couldn't find in BR, so I did not investigate any further.

Best regards,

  Michael.

-- 
Michael Rommel, Erlangen, Germany

On Sep 21, 2013, at 11:43 , Woody Wu <narkewoody@gmail.com> wrote:

> Hi,
> 
> I found it's too hard to port xscreensaver and it's also too overskill
> to me. What I want is just a screen saver/locker, it can lock the X
> screen after centain time of idle, then drawing a moving picture. After
> use press a key or mouse, it ask for a password.
> 
> Is there such a program in buildroot? I found there is a 'beforelight',
> but running it I just get nothing, looks like the program just crashed
> without any error message.
> 
> Thanks in advance.
> 
> -- 
> I can't go back to yesterday - because I was a different person then
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
