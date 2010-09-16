From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 16 Sep 2010 13:41:36 +0200
Subject: [Buildroot] /etc/ld.so.conf and /etc/ld.so.conf.d in buildroot
 target skeleton
In-Reply-To: <AANLkTimEShvTw0M4Yt4dGE3BbxbX4q4RQ5tfbc-BJ7rb@mail.gmail.com>
References: <AANLkTimEShvTw0M4Yt4dGE3BbxbX4q4RQ5tfbc-BJ7rb@mail.gmail.com>
Message-ID: <AANLkTi=LRi8OJTNY-3_q0_c=qcO4yv-sQoaJr=w=F=sf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yeah, having a an ld.so.conf which includes every files within
/etc/ld.so.conf.d/*.conf would be great !

Regards,

--
Lionel Landwerlin

On Thu, Sep 16, 2010 at 1:28 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hello,
>
> In the buildroot target skeleton exists a directory ld.so.conf.d, but
> no file ld.so.conf.
> The ld.so.conf.d directory is not parsed, unless you include the files
> there from ld.so.conf, like so:
>
> include /etc/ld.so.conf.d/*.conf
>
> I am wondering why this is the case. Shouldn't there be a skeleton
> /etc/ld.so.conf file?
> If not, how is /etc/ld.so.conf.d supposed to be used?
>
