From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 19:57:45 +0200
Subject: [Buildroot] [PATCH v6 1/1] mosh: new package
In-Reply-To: <1437844972-11261-1-git-send-email-christian@paral.in>
References: <1437844972-11261-1-git-send-email-christian@paral.in>
Message-ID: <20150725175745.GU3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-25 10:22 -0700, Christian Stewart spake thusly:
> Adding mosh, the mobile shell. Mosh uses ssh or dropbear as an initial transport to
> start mosh-server which uses UDP to communicate with the client.
> Supports a predictive model to enhance performance on weak connections
> and compensate for general lag. Also supports disconnections and
> reconnections seamlessly.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
> new file mode 100644
> index 0000000..a78cb33
> --- /dev/null
> +++ b/package/mosh/mosh.hash
> @@ -0,0 +1 @@
> +sha256 637adb7f67406447e9264d30468fe69a6d5e8f97518ef133d794cdc65483fa54 mosh-1.2.5.tar.gz

BTEW, this hash is incorrect, when you compare to what was published by
upstream. And when I do check here, I get the same hash as publushed,
not yours.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
