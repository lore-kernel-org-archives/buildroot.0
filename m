From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Sep 2017 15:19:43 +0930
Subject: [Buildroot] [PATCH 1/1] package/openipmi: bump version to 2.0.24
In-Reply-To: <20170916141023.11840-1-bernd.kuhls@t-online.de>
References: <20170916141023.11840-1-bernd.kuhls@t-online.de>
Message-ID: <CACPK8Xe=p9GL+0OFbfBPW43LtWRsBD9jPfzaaQ53xHv_cpqm4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat, Sep 16, 2017 at 11:40 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Added md5 hash provided by upstream.
>
> Removed 0001-ui-use-standard-uint32_t.patch, applied upstream:
> https://sourceforge.net/p/openipmi/code/ci/104594630755d6fe187984ce9763d52c8a3481d8/

I made some similar changes in addition to removing an unused configure flag:

http://lists.busybox.net/pipermail/buildroot/2017-September/202409.html

If you're happy with those changes could you add your ack?

Cheers,

Joel
