From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 6 Feb 2018 14:28:42 +0100
Subject: [Buildroot] [PATCH v5 1/2] libkrb5: New package
In-Reply-To: <CAH=K+6krFtqB=hj-Fe+pC6LdHKeE-uLYaSKRuvhmoO6d1Y-=9g@mail.gmail.com>
References: <1517593141-26017-1-git-send-email-nerv@dawncrow.de>
 <CAH=K+6krFtqB=hj-Fe+pC6LdHKeE-uLYaSKRuvhmoO6d1Y-=9g@mail.gmail.com>
Message-ID: <CAH=K+6=G1ON+qsq8Jw7drxsYFXpuAm6fnqSba0bETJLwN65fmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?,

On Tue, Feb 6, 2018 at 2:07 PM, Sam Voss <sam.voss@rockwellcollins.com> wrote:
> Andr?,
>
[snip]
>> +LIBKRB5_VERSION = 1.16
>> +LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/1.16
>
> Can the version number be taken out of the url, and instead use
> $(LIBKRB5_VERSION) once again here?

I actually take this back. I went and checked and minor revisions are
also stored in this folder, so that will not work.

Thanks,

Sam
