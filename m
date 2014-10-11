From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Oct 2014 12:05:47 -0300
Subject: [Buildroot] [PATCH] configs/qemu-sparc-ss10: enable tmpfs
In-Reply-To: <87wq867ttr.fsf@dell.be.48ers.dk>
References: <1412800100-9223-1-git-send-email-gustavo@zacarias.com.ar>
 <87wq867ttr.fsf@dell.be.48ers.dk>
Message-ID: <5439474B.2060006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/2014 08:02 AM, Peter Korsgaard wrote:

> Committed, thanks.
> 
> Perhaps we should force CONFIG_TMPFS=y in linux/linux.mk like we do for
> the other settings?

Such an option should depend on BR2_INIT_* != NONE since it's only
required for our init strategies.
In fact there should be other options set for BR2_INIT_SYSTEMD as well
so it'll require some investigation if we want to go that route.
Regards.
