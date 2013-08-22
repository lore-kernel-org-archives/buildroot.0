From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 22 Aug 2013 21:45:40 +0100
Subject: [Buildroot] [PATCH v2] libsecret: New package
In-Reply-To: <521673F0.8090209@mind.be>
References: <1376567256-13213-1-git-send-email-markos.chandras@imgtec.com>
 <521673F0.8090209@mind.be>
Message-ID: <CAG2jQ8h0SsKdfGRu4xjLXH9Pj1U4sCy_3yL-f6BfS2X21EhJ0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 22 August 2013 21:26, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>  Does the gcrypt support make a major difference for library size or
> compilation time? Otherwise, we usually include it automatically if
> libgcrypt is selected. I personally like to mention this in the help text in
> that case, i.e. something like
>
> Select BR2_PACKAGE_LIBGCRYPT to enable transport encryption.

It does not make huge difference neither in compilation time nor in file size

The libsecret library with the gcrypt support is about 100K bigger in size

I don't mind submitting a new patch removing the
BR2_PACKAGE_LIBSECRET_CRYPTO option.
I sent this patch before seeing your comments on the harfbuzz patch I sent :)

>
>
>  But basically looks good to me. Untested though.
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>

Thank you!

-- 
Regards,
Markos Chandras
