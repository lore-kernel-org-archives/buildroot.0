From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Wed, 9 Oct 2013 16:42:41 +0200
Subject: [Buildroot] [PATCH] New: add lava-test package
In-Reply-To: <20131009135548.7e50453a@skate>
References: <20131008151729.GB3599@ludovic.desroches@atmel.com>
 <1381311283-3534-1-git-send-email-ludovic.desroches@atmel.com>
 <20131009135548.7e50453a@skate>
Message-ID: <20131009144241.GA3378@ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 09, 2013 at 01:55:48PM +0200, Thomas Petazzoni wrote:
> Dear ludovic.desroches at atmel.com,
> 
> On Wed, 9 Oct 2013 11:34:43 +0200, ludovic.desroches at atmel.com wrote:
> > From: Ludovic Desroches <ludovic.desroches@atmel.com>
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > ---
> > 
> > I have the same issues with latest release of Buildroot.
> > 
> > I have added python path replacement in install target instead of doing it in
> > the post-build script. I have added license stuff too and bump to latest
> > version.
> 
> And with this change, does lava-test works for you?
> 

Our lava installation is currently down. I'll see how I can check it.
Since the issue was only python path, I hope it should be working.

Regards

Ludovic
