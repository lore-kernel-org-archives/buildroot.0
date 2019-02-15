From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:44:32 +0100
Subject: [Buildroot] [PATCH v1] package/pulseaudio: fix S50pulseaudio
 init script
In-Reply-To: <20190213190547.6383-1-ps.report@gmx.net>
References: <20190213190547.6383-1-ps.report@gmx.net>
Message-ID: <20190215224432.09e3e765@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Feb 2019 20:05:47 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - fix the following start warnings:
> 
>   W: [pulseaudio] main.c: Running in system mode, but --disallow-exit not set.
>   W: [pulseaudio] main.c: Running in system mode, but --disallow-module-loading not set.
>   N: [pulseaudio] main.c: Running in system mode, forcibly disabling SHM mode.
>   N: [pulseaudio] main.c: Running in system mode, forcibly disabling exit idle time.
> 
> - fix the following stop error:
> 
>   E: [pulseaudio] main.c: Failed to kill daemon: No such process
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/pulseaudio/S50pulseaudio | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
