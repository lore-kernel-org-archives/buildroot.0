From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 25 May 2014 19:46:54 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-24
In-Reply-To: <20140525133708.GA3542@free.fr>
References: <20140525063007.921281015A1@stock.ovh.net>
 <20140525133708.GA3542@free.fr>
Message-ID: <CAMo8Bf+XBo1S=2k_NO0De8WeesKszXU17AYy7sKLZ0hY+KJjQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 25, 2014 at 5:37 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-05-25 08:30 +0200, Thomas Petazzoni spake thusly:
>> Detail of failures
>>        arm |                     php-5.5.12 | NOK | http://autobuild.buildroot.net/results/39e9980691c693b26e2db76ee7babbc0b5321248/
>
> Unable to reproduce here.
>
> There's another more recent failure of php on ARM:
>     http://autobuild.buildroot.net/results/5bc/5bcf8475f5ef7800efdff6be3aa4d7109ab76b67/
> which I was also unable to reproduce.

The log still has -I/include in compilation commands, means that php
still gets misconfigured. See
http://lists.busybox.net/pipermail/buildroot/2014-April/094079.html
for my previous analysis of it.

-- 
Thanks.
-- Max
