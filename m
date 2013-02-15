From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Feb 2013 06:09:14 +0100
Subject: [Buildroot] [PATCH] add pre-build script
In-Reply-To: <511D60BC.9000205@mind.be>
References: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
 <511C1281.5040502@mind.be>
 <CAEBucnA1BebDBHWb4PcQBGiUpyiAcT0=vs3Tu4D+LVw1YdN0_A@mail.gmail.com>
 <20130214085604.52619b06@skate>
 <CAEBucnCBe83aOfTPOTfjvVjKNAdE0CbYp540-OPZy-ecgEYuMA@mail.gmail.com>
 <20130214180402.6b2dbb17@skate> <511D60BC.9000205@mind.be>
Message-ID: <20130215060914.4f889699@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 14 Feb 2013 23:10:04 +0100, Arnout Vandecappelle wrote:

> > Indeed, but the pre-build script approach you posted would not allow to
> > customize the CFLAGS.
> 
>   Spenser didn't post it...

Ah, I got confused with the patch from "Joe Halpin"
<jhalpin@luminatorusa.com> in the same thread. Isn't this the same
thing? I'm not sure how Joe's patch is related to Spenser's discussion.

But surely, the patch from Joe Halpin does allow to alter the
configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
