From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 5 Aug 2009 13:55:05 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: factor out libuuid support
In-Reply-To: <87ocquo52y.fsf@macbook.be.48ers.dk>
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
	<20090803143614.GK19257@buzzloop.caiaq.de>
	<20090803165815.312deddd@surf>
	<20090803150941.GM19257@buzzloop.caiaq.de>
	<873a88sjx0.fsf@macbook.be.48ers.dk>
	<20090804082822.GO19257@buzzloop.caiaq.de>
	<87ocquo52y.fsf@macbook.be.48ers.dk>
Message-ID: <20090805115505.GD19257@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 05, 2009 at 01:47:17PM +0200, Peter Korsgaard wrote:
>  >> Why did you make this a hidden config? Couldn't we imagine someone
>  >> wanting to use libuuid in their own programs?
> 
>  Daniel> I didn't image that ;) But you're right, that could help. See
>  Daniel> the new patch below.
> 
> Thanks, committed.

Great, thanks. Could you merge the ubifs-target patch as well.
(That was 2/ of my original posting)

Daniel
