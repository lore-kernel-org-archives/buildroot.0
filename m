From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 12 Oct 2015 17:09:27 +0200
Subject: [Buildroot] [PATCH] imx-gpu-viv: install g2d library and header
In-Reply-To: <1444662194-17583-1-git-send-email-vincent.stehle@freescale.com>
References: <1444662194-17583-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <CAAMH-ytcNvB-9vWq2kSuYgzMa8eS6gXQJ7sNXWoLobhtTaLT1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Mon, Oct 12, 2015 at 5:03 PM, Vincent Stehl?
<vincent.stehle@freescale.com> wrote:
> Freescale gpu-viv binaries archive supplies the libraries and headers
> for accelerated OpenGL ES, OpenCL and OpenVG on i.MX6 platforms.
>
> This binaries archive also supplies a g2d library and its header, which
> allow to perform accelerated 2D operations on i.MX6 platforms in a
> simpler manner. Install those as well, as it is useful for some
> packages, such as e.g. kodi.

I CC'd you to my patch adding the same libraries back in September:
http://patchwork.ozlabs.org/patch/520309/

The difference between yours and mine is that I added an option to
select the G2D libs, not sure if people wants to control it or not but
it didn't cost much.

Also I added the gputools as they can be useful when debugging the
GPU. Please let me know why you offered another patch.

Thanks,
Gary
