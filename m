From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 2 Mar 2018 10:11:22 -0800
Subject: [Buildroot] [PATCH 2/2] apache: pass explicit sbindir
In-Reply-To: <20180302180756.14315-2-chrismcc@gmail.com>
References: <20180302180756.14315-1-chrismcc@gmail.com>
 <20180302180756.14315-2-chrismcc@gmail.com>
Message-ID: <CALURroT9bxvXd=rKYWKAALsmz-hu-p7gYqQhCPTJez56uctH5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello...

Thanks Thomas, I copied and pasted your recomendations



On Fri, Mar 2, 2018 at 10:07 AM, Christopher McCrory <chrismcc@gmail.com>
wrote:

> The apache configure script help indicates that the sbindir is
> PREFIX/sbin , but it actually uses PREFIX/bin.  Most people
> probably expect httpd to be located in /usr/sbin/httpd
>
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>

<snip>
-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180302/57a88bc5/attachment.html>
