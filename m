From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 13 Feb 2014 17:34:23 -0700
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <20140213235458.016c8b6b@skate>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>	<1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>	<20140212190351.GD17804@free.fr>	<52FBC72D.3090706@boundarydevices.com>	<52FBD772.40900@boundarydevices.com>	<20140212234144.GE17804@free.fr>	<52FC2750.7000602@boundarydevices.com>	<20140213225218.GC3259@free.fr>
 <20140213235458.016c8b6b@skate>
Message-ID: <52FD648F.4060103@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 02/13/2014 03:54 PM, Thomas Petazzoni wrote:
> Yann, Eric,
>
> On Thu, 13 Feb 2014 23:52:18 +0100, Yann E. MORIN wrote:
>
>>> Perhaps we can get them to provide a "--showlicense" in the
>>> next release, and change things then.
>>
>> If you have your ways inside Freescale, then it might be a good idea,
>> yes! Unless they're already reading us. NSA, you there? :-]

Friends in high^h^h^h^hstrange places?

>
> On the other hand, our package infrastructure is not able to run a
> command to get the license text. It expects to have one file available
> in the source tree. (Though this can be worked-around by having a post
> extract hook that runs the --showlicense thing and redirects the output
> into a file in the source tree).
>
> So the best way would be to simply tell Freescale to stop doing silly
> self-extractable executables, and switch to normal tarballs, just like
> everyone else does in the Linux world :-)
>

Or nag nicely and provide patches ;)

Regards,


Eric
