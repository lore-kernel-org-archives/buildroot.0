From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 25 Jul 2017 14:46:37 -0700
Subject: [Buildroot] [PATCH] python-toml: add host variant of the package
In-Reply-To: <20170725214647.51f5a3b0@windsurf.home>
References: <20170725045132.363-1-andrew.smirnov@gmail.com>
 <20170725214647.51f5a3b0@windsurf.home>
Message-ID: <CAHQ1cqFD-HK5GQ+Ub2BF=2erU8aQtTu2ts-hj+WrqiQmH6A63Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 25, 2017 at 12:46 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 24 Jul 2017 21:51:32 -0700, Andrey Smirnov wrote:
>> Add host variant of the package to make it availible to custom host
>> tools that might want to use it.
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> Since we still don't have Config.in options for all host packages, I
> continue to be reluctant to add such patches, because host packages
> like this are never tested by the autobuilders: there are no target
> packages that use them.

Just to make sure I understand you correctly: are you saying that this
patch would be acceptable if, besides the change to .mk file, it also
add a dedicated Config.in.host code (e.g. what python-lxml does)? Or
is it a hard NO?

Thanks,
Andrey Smirnov
