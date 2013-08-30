From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 10:30:22 +0200
Subject: [Buildroot] feature or pebkac
In-Reply-To: <52205642.90408@mind.be>
References: <20130829111708.c603e5bf976541d3abd3a43a@lavabit.com>
 <521F9B91.7040903@mind.be> <20130830095831.12c3c743@skate>
 <52205642.90408@mind.be>
Message-ID: <20130830103022.2a1b2330@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 30 Aug 2013 10:22:26 +0200, Arnout Vandecappelle wrote:

> > Can't we do like what we do for shallow clones? Try if --single-branch
> > is supported and works, and if so, all right, if not, fall back to the
> > normal way?
> 
>   Not so easily. For shallow clone, we check up front with ls-remote if 
> it will be possible.  For --single-branch we would have to check the git 
> version. And the download commands already are too complex...
> 
>   I'm really thinking we should move all that to a proper shell script. 
> Then adding that kind of magic would feel as much less of an overhead.

Yes, agreed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
