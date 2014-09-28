From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 28 Sep 2014 20:43:29 +0200
Subject: [Buildroot] [PATCH 1 of 2] check-kernel-headers: mktemp
	--tmpdir not available on RedHat 5
In-Reply-To: <87mw9jwpu2.fsf@dell.be.48ers.dk>
References: <patchbomb.1409649944@localhost>
 <2c7735c0247a4c83a3c2.1409649945@localhost> <87mw9jwpu2.fsf@dell.be.48ers.dk>
Message-ID: <808f5bf8-8245-43b5-ade0-a31e54105873@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> schreef:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> > # HG changeset patch
> > # User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
> > # Date 1407153076 -7200
> > #      Mon Aug 04 13:51:16 2014 +0200
> > # Node ID 2c7735c0247a4c83a3c2ea1d58e74be613465255
> > # Parent  6af0c3866b64670bb6d62302b64f3164b1f70fb6
>
>Is all of this hg noise needed? Your patches didn't used to contain
>this.

Oi sorry, I have forgotten a switch to turn this off here.

>
> > check-kernel-headers: mktemp --tmpdir not available on RedHat 5
>
> > mktemp --tmpdir is not available on older Redhat 5 machines. The alternative
> > that has the same behavior is 'mktemp -t'.
>
>Redhat Linux 5.0, that was one of the very first Linux distributions I
>ever used - It's been a while ;) 
>
>I guess you mean RHEL 5, so I've adjusted the commit message and
>committed, thanks.

Thanks, I do indeed mean RHEL5, wasn't aware that there was a difference.

Best regards,
Thomas
