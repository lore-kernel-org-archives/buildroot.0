From: Maxim Cournoyer <maxim.cournoyer@savoirfairelinux.com>
Date: Thu, 25 Jun 2020 17:07:38 -0400 (EDT)
Subject: [Buildroot] [PATCH] packages/pkg-download.mk: fix file locking
 over NFS
In-Reply-To: <20200625202718.GO20645@scaer>
References: <1993147260.30143.1593108698133.JavaMail.zimbra@savoirfairelinux.com>
 <20200625202718.GO20645@scaer>
Message-ID: <1222816932.36161.1593119258691.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

----- Original Message -----
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Maxim Cournoyer" <maxim.cournoyer@savoirfairelinux.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Thursday, June 25, 2020 4:27:18 PM
> Subject: Re: [Buildroot] [PATCH] packages/pkg-download.mk: fix file locking over NFS

> Maxim, All,
> 
> On 2020-06-25 14:11 -0400, Maxim Cournoyer spake thusly:
>> The attached patch fixes the NFS lock mechanism not working.
> 
> You should talk to your Savoir-faire Linux colleagues: they manage to
> send patches to the list.

I'll definitly look into it prior to my next contribution :-).

> I've added a blurb about the creation of the lock file when it is
> missing, and applied to master. Thanks.

That was quick! Thank you for the prompt resolution.

Cheers,

Maxim
