From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 20:16:48 -0300
Subject: [Buildroot] [PATCH 4/9] check-package: check *.hash files
References: <CAAXf6LVJgdMqDuUcfzDdW8Mw19ukfCRcaR8SdvhPyoiqhiGeFA@mail.gmail.com>
Message-ID: <58aa2760dc756_37663ff65c2c0d0c4163c@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Jan 24, 2017 at 07:18 PM, Thomas De Schampheleire wrote:

[snip]
>> +FILENAME_WITH_SLASH = re.compile("/")
[snip]
>> +    if FILENAME_WITH_SLASH.search(filename):
> 
> This is overkill. It is more simple and I expect more performant to just do:
> 
>     if '/' in filename:

Fixed in v2.

Regards,
Ricardo
