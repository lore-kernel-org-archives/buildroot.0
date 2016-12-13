From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Dec 2016 16:53:42 -0200
Subject: [Buildroot] [PATCH] mx6sx: Add support for mx6sx udoo neo boards
In-Reply-To: <878trj3brv.fsf@dell.be.48ers.dk>
References: <1481649193-29371-1-git-send-email-fabio.estevam@nxp.com>
 <878trj3brv.fsf@dell.be.48ers.dk>
Message-ID: <CAOMZO5CFO9FMAtkZXLur4AKD0FibYouJ=EGh5VtiS_2c38CbCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 13, 2016 at 4:49 PM, Peter Korsgaard <peter@korsgaard.com> wrote:

> One more comment, doesn't the A9 in the mx6sx have a VFP and NEON
> support? If so, please enable them like we do for
> E.G. nitrogen6x_defconfig.

Yes, let me do this for all the imx6 boards, thanks.
