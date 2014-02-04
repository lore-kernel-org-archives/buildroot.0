From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 4 Feb 2014 09:27:13 +0000
Subject: [Buildroot] [PATCH] mmc-utils: Fix 64-bit values redefinition
In-Reply-To: <8738jzmerg.fsf@dell.be.48ers.dk>
References: <1391075946-30850-1-git-send-email-Vincent.Riera@imgtec.com>
 <8738jzmerg.fsf@dell.be.48ers.dk>
Message-ID: <52F0B271.1000401@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/2014 09:02 AM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
>   > Some toolchains include asm-generic/int-l64.h from their asm/types.h
>   > file for certain 64-bit architectures. This causes a conflict between
>   > types like this one:
>
>   > asm-generic/int-l64.h:28:25: error: conflicting types for '__s64'
>   >  typedef __signed__ long __s64;
>   >              ^
>   > In file included from mmc.h:17:0,
>   >          from mmc_cmds.c:30:
>   > asm-generic/int-ll64.h:29:44: note: previous declaration of '__s64' was
>   > here
>   >  __extension__ typedef __signed__ long long __s64;
>
>   > This patch has been submitted upstream.
>
> Did you hear back? I see nothing has changed in the git repo for quite
> some time.
>
> Committed, thanks.
>

No, unfortunately I haven't received any reply from them.

-- 
Vincent
