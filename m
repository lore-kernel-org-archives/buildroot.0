From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed, 26 Jun 2013 19:09:48 +0200
Subject: [Buildroot] [PATCH] package/libmicrohttpd: minor fixes and
	additions
In-Reply-To: <51CA0AD2.7030006@mind.be>
References: <1372187313-15042-1-git-send-email-c.schoenert@gmail.com>
 <51CA0AD2.7030006@mind.be>
Message-ID: <51CB205C.7010200@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 25.06.2013 23:25, schrieb Arnout Vandecappelle:
>  Quick check tells me it's LGPLv2.1+

Ah, yes. I just looked into COPYING. Will correct.

>  I would write "LGPLv2.1+ or eCos license" to make the choice more
> explicit, else it looks as if both licenses apply.

Also true. Agreed.

>  We would typically put the LGPLv2.1 or eCos option in the else branch
> of the condition, rather than overwriting it.

I was thinking about that, but decided to the kind I made the patch. I
prepare a new patch and will resend.

Regards
Carsten
