From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:36:21 +0200
Subject: [Buildroot] [PATCH 1/1] openssh: replace individual ssh-keygen
 calls with a single call
In-Reply-To: <1407028879-2004-1-git-send-email-danomimanchego123@gmail.com>
References: <1407028879-2004-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140803103621.213b77e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sat,  2 Aug 2014 21:21:19 -0400, Danomi Manchego wrote:
> Since openssh-6.0, the ssh-keygen app has supported a -A option,
> which creates any missing keys.  This frees us of having to add
> new ssh-keygen invocations as new key types are introduced.  This
> also frees us of having to know the default key names and locations.
> So this patch replaces all the the init.d script invocations with
> a single "ssh-keygen -A" call.
> 
> Note: the systemd service script *already* uses this option.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Applied, thanks!

Thomsa
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
