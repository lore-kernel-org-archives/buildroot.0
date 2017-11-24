From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 24 Nov 2017 20:12:15 +0100
Subject: [Buildroot] [PATCH/next v2 3/3] package/python-mwclient: bump
 version to 0.8.6
In-Reply-To: <20171124152816.021c5ae6@windsurf.lan>
References: <20171112104523.16791-1-bernd.kuhls@t-online.de>
 <20171112104523.16791-3-bernd.kuhls@t-online.de>
 <20171124152816.021c5ae6@windsurf.lan>
Message-ID: <CAGm1_ku9aHQYXjEX1zP9O85weDgYjHG9jvmqk+8J1H7bB61nhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 24, 2017 at 3:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 12 Nov 2017 11:45:23 +0100, Bernd Kuhls wrote:
>> Version 0.8.2 added OAuth support so we need python-requests-oauthlib
>> as runtime dependency from now on. This package also has a runtime
>> dependency on python-requests so all we need is to update the select
>> command in Config.in.
>>
>> Removed patch applied upstream.
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>> v2: no changes
>
> Apparently this update is causing a new build failure:
> http://autobuild.buildroot.net/results/79e/79ef04d2e8c91231028e23f4bb35df685efa55ca/build-end.log.
>
> Could you have a look?
>
> Thanks a lot!

I've opened an issue [1]

[1] https://github.com/mwclient/mwclient/issues/179

Yegor
