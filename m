From: Micha Nelissen <micha@neli.hopto.org>
Date: Sat, 18 Oct 2008 21:03:53 +0200
Subject: [Buildroot] Madplay improved patch for alsa audio
In-Reply-To: <87od1hivha.fsf@macbook.be.48ers.dk>
References: <gdcqmh$tuu$1@ger.gmane.org> <87od1hivha.fsf@macbook.be.48ers.dk>
Message-ID: <48FA3319.600@neli.hopto.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Micha" == Micha Nelissen <micha@neli.hopto.org> writes:
> 
>  Micha> Hi,
>  Micha> Attached is an improved patch for alsa backend of madplay.
>  Micha> * fix allocation of buffer, buffer_size is number of frames
>  Micha> * use default 16 bit depth (some hardware has small buffers, 16/24 bit
>  Micha> difference is very small)
> 
> Have you sent this upstream? I don't right away see any in the mad-dev
> archive.

I haven't sent it upstream. Where is that actually? Should I post it to 
the patches forum at sourceforge?

Micha
