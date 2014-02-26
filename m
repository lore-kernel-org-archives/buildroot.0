From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Feb 2014 22:04:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-25
In-Reply-To: <87fvn5d1wb.fsf@dell.be.48ers.dk>
References: <20140226073009.06EDD100CEF@stock.ovh.net>
 <87k3cigt81.fsf@dell.be.48ers.dk> <20140226215740.4fd07066@skate>
 <87fvn5d1wb.fsf@dell.be.48ers.dk>
Message-ID: <20140226220400.3bb8a164@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 26 Feb 2014 22:01:24 +0100, Peter Korsgaard wrote:

>  >> Thomas, I think you looked into it and it was something about it picking
>  >> up lzma from the build machine. Do you have a fix?
> 
>  > Yeah, probably need to explicitly disable lzma support from
>  > host-libxml2, I'd say.
> 
> Ok, will you send a patch or should I look into it? It seems we don't do
> anything for lzma on the target either.

Will send a patch tonight.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
