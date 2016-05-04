From: Martin Bark <martin@barkynet.com>
Date: Wed, 4 May 2016 11:10:00 +0100
Subject: [Buildroot] [PATCH 1/5] package/nginx: bump version to 1.10.0
In-Reply-To: <20160503163329.GR26720@waldemar-brodkorb.de>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
 <20160503163329.GR26720@waldemar-brodkorb.de>
Message-ID: <CAFGQKxc7s3ufeQV80Bgm9qvr863S94o_0Pk_MnsrSu_nMG-mvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On 3 May 2016 at 17:33, Waldemar Brodkorb <wbx@openadk.org> wrote:
> Hi Martin,
> Martin Bark wrote,
>
>> The ngx_http_spdy_module has been superseded by the ngx_http_v2_module
>> so BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE has changed to
>> BR2_PACKAGE_NGINX_HTTP_V2_MODULE
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> Could you check on sparc? I think nginx depends nowadays on some
> atomics which aren't available for sparc32.
> Could you take care of it? There are autobuild failures...

I just ran a quick test and 1.10.0 shows the same errors on sparc as
1.8.1 does.  I'll have a look at fixing it.

Thanks

Martin

>
> best regards
>  Waldemar
