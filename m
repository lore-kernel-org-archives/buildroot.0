From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Wed, 07 Jan 2015 01:18:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: bump to version 0.10.35
In-Reply-To: <20150106215428.4fbe18d4@free-electrons.com>
References: <1420475737-13153-1-git-send-email-jkrause@posteo.de>
 <20150106215428.4fbe18d4@free-electrons.com>
Message-ID: <1420589939.3625.7.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Di, 2015-01-06 at 21:54 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Mon,  5 Jan 2015 17:35:36 +0100, J?rg Krause wrote:
> > Signed-off-by: J?rg Krause <jkrause@posteo.de>
> > ---
> >  package/nodejs/nodejs.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Both patches applied, thanks!
> 
> Since you're doing nodejs stuff, could you have a look at the thread
> "[Buildroot] Float error on SAMA5D3 Xplained using nodejs" which
> started on December, 5th on the mailing list? I proposed a patch for
> nodejs to fix a problem reported by an user, which was tested
> successfully, but I never had the time to submit it properly. If you
> have some time, could you borrow my patch, and submit it properly after
> testing?

I'm using nodejs on an ARM-based board wich does not have a FPU. But
I've a Beaglebone Black board which has one. So, I'll put in on my to-do
list.

J?rg
