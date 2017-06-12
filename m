From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 12 Jun 2017 13:29:25 -0700
Subject: [Buildroot] [PATCH v3 00/11] Update IPython's dependencies
In-Reply-To: <20170611150813.5be2e14b@windsurf.home>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170611150813.5be2e14b@windsurf.home>
Message-ID: <CAHQ1cqE8hh+7Ja10owqOe=BYcW8uCa8=eC7Zd4aZLTpLk+sZ0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 11, 2017 at 6:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Andrey,
>
> On Fri,  2 Jun 2017 16:56:42 -0700, Andrey Smirnov wrote:
>
>> Andrey Smirnov (11):
>>   DEVELOPERS: Add missing closing angle bracket to my e-mail
>
> Applied.
>
>>   package/python-enum34: Switch setup type to 'setuptools'
>
> Was already applied.
>
>>   package/python-simplegeneric: Switch setup type to 'setuptools'
>>   package/python-ipython-genutils: New package
>
> Both applied.
>
>>   package/python-traitlets: New package
>>   package/python-scandir: New package
>>   package/python-pathlib2: New package
>>   package/python-pickleshare: New package
>>   package/python-backports-shutil-get-terminal-size: New package
>>   package/python-ipython: Add dependecy list
>>   python-ipython: bump to version 5.4.0
>
> For all those ones, Yegor Yefremov made a number of comments. Could you
> address them, and send a v4 ?
>

Yes, I will do that.

Yegor:

Just to avoid spamming the mailing list replying to all of your
messages: thank you for your reviews and I'll address the issues you
pointed out.


> Make sure to base your v4 on the latest master, and to not resend
> patches that have already been applied.
>

Will do.

Thanks,
Andrey Smirnov
