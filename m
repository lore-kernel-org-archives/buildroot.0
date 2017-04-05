From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Apr 2017 16:51:12 +0200
Subject: [Buildroot] [PATCH v2 2/2] Take ownership of the (orphaned)
 syslinux package.
In-Reply-To: <1491398930-6130-2-git-send-email-benoit.allard@greenbone.net>
References: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
 <1491398930-6130-1-git-send-email-benoit.allard@greenbone.net>
 <1491398930-6130-2-git-send-email-benoit.allard@greenbone.net>
Message-ID: <25532712-ae57-f4c4-3098-835ef68c1caf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Probably Thomas will apply before you respin, but if he doesn't:

 It is nice for 'git log --oneline' output if the subject line contains your
name, i.e.:

DEVELOPERS: add Beno?t Allard for boot/syslinux

On 05-04-17 15:28, Beno?t Allard wrote:
> As it turns out, I am the only one who touched it in the last year.

 Also we generally avoid using "I" in commit messages (except below --- of
course). In this case I think it's warranted, though.

 Regards,
 Arnout

> 
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 37c610e..fbc70e5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -150,6 +150,7 @@ N:	Benjamin Kamath <kamath.ben@gmail.com>
>  F:	package/lapack/
>  
>  N:	Beno?t Allard <benoit.allard@greenbone.net>
> +F:	boot/syslinux/
>  F:	package/dc3dd/
>  
>  N:	Bernd Kuhls <bernd.kuhls@t-online.de>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
