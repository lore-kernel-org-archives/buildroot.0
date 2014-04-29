From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 29 Apr 2014 07:28:42 +0200
Subject: [Buildroot] [RFC PATCH 0/2] gitorious helper
In-Reply-To: <9a8529fc-851d-4302-9198-67a100db0f26@email.android.com>
References: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAAXf6LWy3cXCxTLZcPo+pgXeHjNwc2+uVGyJZZLYJ8RP2rCFHA@mail.gmail.com>
 <20140110163510.1d2c8d8a@skate> <20140429051126.GA32291@piout.net>
 <9a8529fc-851d-4302-9198-67a100db0f26@email.android.com>
Message-ID: <20140429052841.GB32291@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/2014 at 07:18:08 +0200, Thomas De Schampheleire wrote :
> Alexandre Belloni <alexandre.belloni@free-electrons.com> schreef:
> >After discussing quickly with Thomas, we feel that we can drop it as
> >this would not really help with readability.
> 
> Readability wasn't the only reason such helpers were introduced. For github, the download urls changed a few times, and having it coded in only one place made changing this much easier.
> So if that us the only reason I prefer to keep this patch. I'm willing to adopt it by the way...
> 

Feel free to adopt it but I'm not sure we can have something easy to use
and elegant.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
