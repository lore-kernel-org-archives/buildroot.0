From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 17:28:06 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: fix build with disabled thread
 support
In-Reply-To: <20190802151529.29589-1-petr.vorel@gmail.com>
References: <20190802151529.29589-1-petr.vorel@gmail.com>
Message-ID: <20190802172806.1370ec68@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  2 Aug 2019 17:15:29 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/10652b7bf6a606f0dd802916006c44abf3e5e059
> http://autobuild.buildroot.net/results/9656af1aafbd2624fb75bf5fc1dfa13b6175c10b
> http://autobuild.buildroot.net/results/2e170e149b293d40978e158d55dc0102315b9d86
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/iputils/iputils.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
