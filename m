From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 3 Nov 2014 15:14:43 +0000
Subject: [Buildroot] [PATCH 1/1] package/sdl_sound: Fix build with
	BR2_ENABLE_DEBUG=yes
In-Reply-To: <87bnp7ck1d.fsf@dell.be.48ers.dk>
References: <1413781229-23932-1-git-send-email-bernd.kuhls@t-online.de>
 <87bnp7ck1d.fsf@dell.be.48ers.dk>
Message-ID: <54579BE3.4010508@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard and Bernd Kuhls,

On 10/20/2014 07:49 AM, Peter Korsgaard wrote:
>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
> 
>  > Fixes
>  > speex.c: In function 'process_header':
>  > speex.c:140:10: error: assignment discards 'const' qualifier from pointer target type [-Werror]
>  >      mode = speex_mode_list[header.mode];
>  >           ^
>  > cc1: all warnings being treated as errors
> 
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Thanks, but it would be nice to use something upstreamable
> instead. Either fix the constness (speex_mode_list has afaik returned a
> const for a very long time) or discuss with upstream about disabling
> -Werror in configure.in.

Reported upstream:

http://lists.libsdl.org/pipermail/sdl-libsdl.org/2014-November/096804.html

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
