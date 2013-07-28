From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Jul 2013 11:12:05 -0300
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
In-Reply-To: <20130728160342.476c95ce@skate>
References: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
 <51DFDA1F.60904@zacarias.com.ar>
 <CAAXf6LWVWj-Z2Od9Zc=QjWELd3_R+5MQ+gTBo=dO-VgFiDoxGg@mail.gmail.com>
 <51F50077.2060204@zacarias.com.ar> <20130728151418.70891325@skate>
 <51F51EBE.4000701@zacarias.com.ar> <20130728155156.1bc37ffd@skate>
 <51F52439.4060001@zacarias.com.ar> <20130728160342.476c95ce@skate>
Message-ID: <51F526B5.10407@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/28/2013 11:03 AM, Thomas Petazzoni wrote:

> Right. But then maybe the 2>/dev/null should be removed, so that if the
> sysctl file to set the hotplug helper doesn't exist, the user sees that
> something is wrong?
> 
> (That said, I think CONFIG_HOTPLUG has become mandatory in recent
> kernels, so it shouldn't be a big problem.)

Yes, it's been for a while it seems, not completely cleaned up from the
kernel though (it's still mentioned in Documentation, several defconfigs
and a couple of source files).
Ok, i'll resend without the stderr pipe.
Regards.
