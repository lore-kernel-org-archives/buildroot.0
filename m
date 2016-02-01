From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 21:00:55 +0100
Subject: [Buildroot] [PATCH 02/22] package/python-characteristic: new
	package.
In-Reply-To: <56AFA716.4060108@mind.be>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-3-git-send-email-mc5686@mclink.it>
 <CAGm1_ks8JT7QWkRtArXixm-kvN0D2tXSDvXk2nZPYfke+2h2fg@mail.gmail.com>
 <56AFA716.4060108@mind.be>
Message-ID: <CAGm1_kvj1xEUJV0um5mq2QU8yKih6s06T7dk47D=kd_z3LQKEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 7:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 01-02-16 16:14, Yegor Yefremov wrote:
>> On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
>>> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
>>> ---
>>>  package/Config.in                                        |  1 +
>>>  package/python-characteristic/Config.in                  |  8 ++++++++
>>>  package/python-characteristic/python-characteristic.hash |  3 +++
>>>  package/python-characteristic/python-characteristic.mk   | 15 +++++++++++++++
>>>  4 files changed, 27 insertions(+)
>>>  create mode 100644 package/python-characteristic/Config.in
>>>  create mode 100644 package/python-characteristic/python-characteristic.hash
>>>  create mode 100644 package/python-characteristic/python-characteristic.mk
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index 09c2b40..53734fd 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -623,6 +623,7 @@ menu "External python modules"
>>>         source "package/python-can/Config.in"
>>>         source "package/python-certifi/Config.in"
>>>         source "package/python-cffi/Config.in"
>>> +       source "package/python-characteristic/Config.in"
>>>         source "package/python-cheetah/Config.in"
>>>         source "package/python-cherrypy/Config.in"
>>>         source "package/python-coherence/Config.in"
>>> diff --git a/package/python-characteristic/Config.in b/package/python-characteristic/Config.in
>>> new file mode 100644
>>> index 0000000..625e27e
>>> --- /dev/null
>>> +++ b/package/python-characteristic/Config.in
>>> @@ -0,0 +1,8 @@
>>> +config BR2_PACKAGE_PYTHON_CHARACTERISTIC
>>> +       bool "python-characteristic"
>>> +       depends on BR2_PACKAGE_PYTHON
>>
>> remove depends
>
>  Do you mean that this package works on python3?

Yes. We have discussed this on IRC. This just a reminder.

Yegor
