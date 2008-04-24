From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 24 Apr 2008 17:27:13 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <87ej8vyqzy.fsf@macbook.be.48ers.dk>
References: <20080424184430.B4D613C849@busybox.net>
	<87iqy713d1.fsf@macbook.be.48ers.dk>
	<46a136670804241230k2fe7dd25p3d2fa0f5650107ef@mail.gmail.com>
	<87ej8vyqzy.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730804241327y444a9dfchf945ca73f4904c24@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I was actually going to wait a little bit to send a patch....
then would have caught this on the diff. But that's quite a small
change anyway. The only thing that makes me uncomfortable is the QMAKE
variable, it could go without the CONFIGURE_OPTS thing.

Anyway, given that it now actually works as opposed to not, that's
quite a minor annoyance.

Btw, it seams to be missing the new Config.in.sql

On Thu, Apr 24, 2008 at 4:47 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>> "John" == John Voltz <john.voltz@gmail.com> writes:
>
>   John> I would assume it was due to changes in the build from the
>   John> different snapshot versions of qtopia. The commit log goes like
>   John> this:
>
>  That still doesn't explain the white space changes. Please cleanup
>  stuff before checking in to buildroot instead of simply mirroring what
>  you have in the other repo.
>
>  Or alternatively, send the indivual changes as patches and give us
>  some days to comment before checking in.
>
>  --
>
>
> Bye, Peter Korsgaard
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
