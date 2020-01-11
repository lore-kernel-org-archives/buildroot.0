From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 20:21:45 -0800
Subject: [Buildroot] [PATCH 1/2] package/docker-containerd: bump to 1.3.2
In-Reply-To: <87pnfrg0x6.fsf@dell.be.48ers.dk>
References: <20200110045033.1920685-1-christian@paral.in>
 <87pnfrg0x6.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2puYbJDhqUzYzxfyqV9DzBPwHDyUgxa42y5QFoUT=QrRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Jan 10, 2020 at 12:39 AM Peter Korsgaard <peter@korsgaard.com> wrote:
> Can you provide a more detailed commit message, please?
>
> In the past we have matched the runc and containerd versions with what
> upstream uses for docker-ce.
>
> What does this bring when used with docker-engine 19.03? Is it
> compatible?

It's not necessary to version match them anymore, as of the recent
versions they are separate projects. In fact, it may be worthwhile to
rename the "docker-containerd" package to simply "containerd."

Best regards,
Christian
