From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 17 May 2016 09:51:57 +0200
Subject: [Buildroot] [PATCH 1/2] python-flask-jsonrpc: new package
In-Reply-To: <e98205ca-9b8e-d464-5566-a208d158f086@armadeus.com>
References: <1462975669-18032-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20160513223526.50f5264d@free-electrons.com>
 <e98205ca-9b8e-d464-5566-a208d158f086@armadeus.com>
Message-ID: <CAGm1_kvU9wdLV-xJw8F=VVXnh_wLwdfws0usdCUXCew9yfxm8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 17, 2016 at 9:35 AM, S?bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:
> Hello,
>
> On 05/13/2016 10:35 PM, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Wed, 11 May 2016 16:07:48 +0200, S?bastien Szymanski wrote:
>>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>>> ---
>>>  package/Config.in                                      |  1 +
>>>  package/python-flask-jsonrpc/Config.in                 |  7 +++++++
>>>  package/python-flask-jsonrpc/python-flask-jsonrpc.hash |  3 +++
>>>  package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 14 ++++++++++++++
>>>  4 files changed, 25 insertions(+)
>>>  create mode 100644 package/python-flask-jsonrpc/Config.in
>>>  create mode 100644 package/python-flask-jsonrpc/python-flask-jsonrpc.hash
>>>  create mode 100644 package/python-flask-jsonrpc/python-flask-jsonrpc.mk
>>
>> I've applied to next, after doing the following changes:
>>
>>     [Thomas:
>>      - make python-flask a runtime dependency only, as noticed by Yegor
>>        Yefremov.
>>      - use setup.py as the license file.]
>>
>> Thanks for the contribution, and thanks Yegor for the review!
>>
>> Thomas
>>
>
> FYI, I've sent an e-mail to the maintainer, as suggested by Yegor, but
> he didn't answer me.
> Anyway, thank you !

Perhaps it were better to create an issue on GitHub instead of
contacting the maintainer directly, but let's just wait a week and
see, what happens.

Btw. a new version was already released 0.3.1 :-) License file isn't
in the release archive :-(

Yegor
