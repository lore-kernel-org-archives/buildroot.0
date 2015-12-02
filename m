From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 2 Dec 2015 17:00:28 -0500
Subject: [Buildroot] uClibc-admins post from martin@barkynet.com
 requires approval
In-Reply-To: <878u5cfs82.fsf@dell.be.48ers.dk>
References: <mailman.2362.1449086836.25824.uclibc-admins@busybox.net>
 <CAC1BbcQHvWVm9LxysSR=6605h1C7Kk-Dg2thMNE4CKq3_KpPNw@mail.gmail.com>
 <878u5cfs82.fsf@dell.be.48ers.dk>
Message-ID: <20151202220028.GG23754@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02 Dec 2015 22:36, Peter Korsgaard wrote:
> >>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
> 
>  >> From: Martin Bark <martin@barkynet.com>
>  >> Cc:
>  >> Date: Wed, 2 Dec 2015 20:07:13 +0000
>  >> Subject: 2015.11 missing from version field
>  >> Hi,
>  >> 
>  >> Can you please add 2015.11 to the version field in bugzilla.
> 
>  > Done. I'd prefer if you could ask the buildroot folks directly next time.
> 
> Yes, me too. I normally remember to add the releases, but this time I
> forgot.

i've added a bugzilla component, but not sure that'll really help smooth
over this scenario.  i looked at the API available, but i'm not seeing a
callback to update the versions list.
	https://www.bugzilla.org/docs/4.4/en/html/api/

there is one to get the current list:
	https://www.bugzilla.org/docs/4.4/en/html/api/Bugzilla/WebService/Product.html

maybe the buildroot release scripts can print a reminder ?
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151202/85f18ca6/attachment.asc>
