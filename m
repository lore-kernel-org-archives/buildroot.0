From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 2 Dec 2015 18:31:18 -0500
Subject: [Buildroot] uClibc-admins post from martin@barkynet.com
	requires approval
In-Reply-To: <87a8pse9tb.fsf@dell.be.48ers.dk>
References: <mailman.2362.1449086836.25824.uclibc-admins@busybox.net>
 <CAC1BbcQHvWVm9LxysSR=6605h1C7Kk-Dg2thMNE4CKq3_KpPNw@mail.gmail.com>
 <878u5cfs82.fsf@dell.be.48ers.dk>
 <20151202220028.GG23754@vapier.lan>
 <87a8pse9tb.fsf@dell.be.48ers.dk>
Message-ID: <20151202233118.GH23754@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02 Dec 2015 23:59, Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> 
>  > i've added a bugzilla component, but not sure that'll really help smooth
>  > over this scenario.  i looked at the API available, but i'm not seeing a
>  > callback to update the versions list.
>  > 	https://www.bugzilla.org/docs/4.4/en/html/api/
> 
>  > there is one to get the current list:
>  > 	https://www.bugzilla.org/docs/4.4/en/html/api/Bugzilla/WebService/Product.html
> 
>  > maybe the buildroot release scripts can print a reminder ?
> 
> It actually already does, it was just late and I forgot:
> 
> echo "also don't forget to add the version to bugzilla"

there is an update API:
	https://www.bugzilla.org/docs/4.4/en/html/api/Bugzilla/WebService/Product.html#update

but version fields aren't yet exposed.  there's an open bug upstream w/code,
but looks like things have stalled.  i'll let you know if/when that shows up.
	https://bugzilla.mozilla.org/show_bug.cgi?id=777047
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151202/172cd810/attachment.asc>
