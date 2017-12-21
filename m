From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 21 Dec 2017 00:26:00 -0200
Subject: [Buildroot] [PATCHv2] gitlab-ci: add .config to artefacts
References: <20171220141933.27736-1-yann.morin.1998@free.fr>
Message-ID: <5a3b1bb869f54_7ead14889647216f@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Dec 20, 2017 at 12:19 PM, Yann E. MORIN wrote:

> The defconfig is dumped at the very beginning of the build log, but the
> resulting .config is still interesting to get, in case some settings did
> not end up in there (e.g. because of the host gcc version, or because of
> conflicting settings, or because the Config.in changed without the tests
> being updated, or...).
> 
> So, add the .config to the list of artefacts to save.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
