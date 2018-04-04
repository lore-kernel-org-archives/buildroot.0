From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Apr 2018 08:15:58 +0200
Subject: [Buildroot] [PATCH] core/download fix local backend
In-Reply-To: <20180404061049.23054-1-yann.morin.1998@free.fr>
References: <20180404061049.23054-1-yann.morin.1998@free.fr>
Message-ID: <20180404061558.GA3855@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-04-04 08:10 +0200, Yann E. MORIN spake thusly:
> The backend is now named after the scheme, which is 'file' for a local
> file.

Hold-on on that one, I missed a proper test (it was falling back to the
backup mirror...)

Regards,
Yann E. MORIN.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/download/{cp => file} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename support/download/{cp => file} (100%)
> 
> diff --git a/support/download/cp b/support/download/file
> similarity index 100%
> rename from support/download/cp
> rename to support/download/file
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
