From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 7 May 2012 09:47:31 -0400
Subject: [Buildroot] [PATCH 2/2] Adjust v86d.mk per better source URL
 and build method.
In-Reply-To: <20120507154541.325b298d@skate>
References: <1336386538-27684-1-git-send-email-golubovsky@gmail.com>
 <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
 <20120507110012.GB8916@sapphire.tkos.co.il>
 <CADiAo4KbCYq7YbV7MN3duW+wWXpGhnP77Sk+=PJD5t=71=COYg@mail.gmail.com>
 <20120507154541.325b298d@skate>
Message-ID: <CADiAo4JznUbDze-hqyO7AEfN9yW9kP9ueBhcKPU9Kg9mV-hWTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK Thanks, I'll try this way.

On Mon, May 7, 2012 at 9:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>> I tried that, and it did not compile. -D__i386__ should be given
>> explicitly to cc.
>
> This -D is rather a CFLAGS, so:
>
> ? ? ? ?$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D__i386__" -C $(@D) all


-- 
Dimitry Golubovsky

Anywhere on the Web
