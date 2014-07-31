From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 31 Jul 2014 19:12:18 +0200
Subject: [Buildroot] [PATCH v2 0/3] apply-patches.sh: be quiet when
	"make -s" is used
In-Reply-To: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
References: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC-4noANHB2f3HFYNYyfW4HP65CKf0ms5fig9hDjXibTfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 25, 2014 at 6:38 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> To reduce further the noise when "make -s" is used silence the
> "apply-patches.sh" script.
>
> v2:
>  - move the second patch as first to easy up merging
>  - split the first patch in two (Yann)
>  - add BR_SILENT variable (Yann)

I've sent a newer version:
http://lists.busybox.net/pipermail/buildroot/2014-July/103302.html

BR
-- 
Fabio Porcedda
