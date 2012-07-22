From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 22 Jul 2012 21:20:41 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <20120720222722.5f89af04@skate>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <20120720222722.5f89af04@skate>
Message-ID: <500C5289.2050006@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 20.07.2012 22:27, schrieb Thomas Petazzoni:
> That's the original idea of those targets. That said, I am personally
> open to making changes to their semantic, but I'd prefer to see what
> the opinion of other people in the community.
>
> Best regards,
>
> Thomas
Hello all,

for my point of view the targets do what I expect. I would opt for
keeping the targets as they are and adding other targets that just
rebuild or reconfiguere a single package.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
