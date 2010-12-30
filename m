From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Dec 2010 13:15:26 -0300
Subject: [Buildroot] [Bug 3007] kexec doesn't build: Missing regdef.h
 file
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBDFA@EXV1.corp.adtran.com>
References: <bug-3007-163@https.bugs.busybox.net/>
	<20101228225917.F10AC8EE38@busybox.osuosl.org>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBDFA@EXV1.corp.adtran.com>
Message-ID: <4D1CB01E.4020002@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/30/10 13:02, ANDY KENNEDY wrote:

> There's a lot of hard-coded links in it, but I don't know the whole
> build system enough to use the environmental variables.
> 
> Gustavo -- if you want to "fix" this patch and plug it in to your
> branch, that'd be great ;).
> 
> 
> Andy

Tried with kexec-tools 2.0.2?
Seems it doesn't depend on regdef.h any more...
