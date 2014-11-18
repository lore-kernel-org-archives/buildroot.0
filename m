From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 18 Nov 2014 10:20:09 +0100
Subject: [Buildroot] [git commit] python-tornado: add zlib run-time
	dependency
In-Reply-To: <20141118101306.7d6e64f8@free-electrons.com>
References: <20141118074238.0B8DCB483D@busybox.osuosl.org>
 <20141118101306.7d6e64f8@free-electrons.com>
Message-ID: <CAGm1_kuXVtD-RFAMiQDt+VAFVtzrjZ2czHYt=Gx5z9JAGanTSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 18, 2014 at 10:13 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Tue, 18 Nov 2014 08:39:25 +0100, Peter Korsgaard wrote:
>> commit: http://git.buildroot.net/buildroot/commit/?id=7b1393a04aa928cc9a5d2b5efd7d83bea7f5757b
>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>  package/python-tornado/Config.in |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
>> index c127d0e..870a3de 100644
>> --- a/package/python-tornado/Config.in
>> +++ b/package/python-tornado/Config.in
>> @@ -1,6 +1,7 @@
>>  config BR2_PACKAGE_PYTHON_TORNADO
>>       bool "python-tornado"
>>       depends on BR2_PACKAGE_PYTHON
>> +     select BR2_PACKAGE_PYTHON_ZLIB
>
> Shouldn't we indicate a comment here that says it's a runtime
> dependency?

I'm working on bumping tornado to 4.x version and would add this
comment, when I'm finished.

Yegor
