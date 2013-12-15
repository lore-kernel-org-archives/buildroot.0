From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 15 Dec 2013 14:20:02 -0500
Subject: [Buildroot] [PATCH] erlang: bump to version R16B03
In-Reply-To: <87ppoywlss.fsf@dell.be.48ers.dk>
References: <1386823184-607-1-git-send-email-fhunleth@troodon-software.com>
 <87ppoywlss.fsf@dell.be.48ers.dk>
Message-ID: <CA+-urNT1rgEidRzH9aUhOeQmWBUrShaYnpv=v+Ax_OL0LxD3dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 15, 2013 at 3:38 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
>
>  > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>  > ---
>  >  package/erlang/erlang.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
>  > index 4a94af0..32d18e4 100644
>  > --- a/package/erlang/erlang.mk
>  > +++ b/package/erlang/erlang.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>
>  > -ERLANG_VERSION = R16B01
>  > +ERLANG_VERSION = R16B03
>
> I was just about to commit this, but erlang.org is apparently down :/
> I'll wait until it is back online to not break the autobuilders / people
> using git.

That's good that you checked. It was down the past day or so, but it
seems to be back up now.

Thanks,
Frank
