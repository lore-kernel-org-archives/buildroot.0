From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Fri, 28 Apr 2017 09:02:18 +0200
Subject: [Buildroot] [PATCH v2] x11vnc: update to 0.9.14
In-Reply-To: <1493210235-7076-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <20170426100320.00702ce9@free-electrons.com>
 <1493210235-7076-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <447d88c8-981f-b6c1-2abe-8b7647b47ec6@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 2017-04-26 14:37, Martin Kepplinger wrote:
> This uses x11vnc's new upstream location at github. Autoreconf is
> added because it's really only a code snapshot release.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
> 
> In the end you're right and there's nothing special here. Without any reason,
> buildroot doesn't hold on an old version. People do releases. People break
> stuff. People fix stuff. Since I happen to need a fix in the upcoming 0.9.15
> this is probably more reason to randomly update than other updates have.
> 
> ... I tested it. For me, using Xfbdev, this 0.9.14 works just fine :)
> 
> 
> revision history
> ----------------
> v2: use the github helper instead of a URL
> v1: initial proposal to update 0.9.13 to 0.9.14
> 

Any objections? What *is* to note here maybe, is that with 0.9.14 they
renamed their x11vnc souce directory to src internally. In case people
have patches, they need to be adapted. But again, that's nothing special
here :)

thanks
                   martin
