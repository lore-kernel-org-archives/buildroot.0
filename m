From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Aug 2013 09:37:54 -0300
Subject: [Buildroot] [PATCH 1/1 v2] Hide issue and hostname menu when
 using a custom skeleton.
In-Reply-To: <20130814001125.13282e32@skate>
References: <1358102400-9628-1-git-send-email-sagaert.johan@skynet.be>
 <20130814001125.13282e32@skate>
Message-ID: <520B7A22.80609@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/2013 07:11 PM, Thomas Petazzoni wrote:

> Gustavo, Yann, Thomas, Arnout,
> 
> What do you think of the below patch?
> 
> My main concern is that it handles the case of /etc/issue
> and /etc/hostname, but I see potentially other "System configuration"
> parameters that may conflict with a custom skeleton.
> 
> Thoughts?

+1 to what Yann said.
Haven't tested it's working properly yet but the principle is fine.
The "Root FS skeleton" option should probably be moved to the top,
otherwise a lower option is afecting top ones - a hierarchy/look thing.
Regards.
