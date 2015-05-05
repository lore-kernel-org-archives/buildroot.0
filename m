From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 17:54:37 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <871tivowgh.fsf@dell.be.48ers.dk>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
 <87egmvoxqf.fsf@dell.be.48ers.dk>
 <20150505172610.5e76bcb9@free-electrons.com>
 <871tivowgh.fsf@dell.be.48ers.dk>
Message-ID: <20150505175437.3a32e936@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, 05 May 2015 17:50:06 +0200, Peter Korsgaard wrote:

>  > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > To: buildroot at uclibc.org
>  > Cc: Simon Dawson <spdawson@gmail.com>, Pascal Huerst
>  > <pascal.huerst@gmail.com>, Gustavo Zacarias <gustavo@zacarias.com.ar>,
>  > Vicente Olivert Riera <Vincent.Riera@imgtec.com>, Max Filippov
>  > <jcmvbkbc@gmail.com>, Samuel Martin <s.martin49@gmail.com>, Bernd
>  > Kuhls <berndkuhls@hotmail.com>
> 
>  > If the mailing list configuration could be changed to not do this
>  > stupid trimming of the Cc addresses, it would be great.
> 
> I had a look around, and according to this, it is because these users
> have the nodupes option enabled:
> 
> https://bugs.launchpad.net/mailman/+bug/1216960
> 
> As described below, I have changed the default for new subscribers to
> NOT enable this option, but I don't know how to do it in any bulk way
> for the current subscribers (and if people want that):
> 
> https://www.ietf.org/mail-archive/web/ietf/current/msg37128.html

I suppose it cannot be changed from the Mailman admin interface?

>  >> J?rg mentioned that OE has a patch:
>  >> 
>  >> http://patchwork.openembedded.org/patch/91893/
> 
>  > So let's use it :-)
> 
> Yeah, will you send a patch? ;)

If nobody beats me at it, I'll try.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
