From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 15 Sep 2016 18:49:15 +0000
Subject: [Buildroot] systemd-timesyncd issue
In-Reply-To: <CAK9TtU2U4EsPGL2G48uLDDmuzDDXXnPMJy6iOE1=jCpJu0EjFA@mail.gmail.com>
References: <CAK9TtU2U4EsPGL2G48uLDDmuzDDXXnPMJy6iOE1=jCpJu0EjFA@mail.gmail.com>
Message-ID: <CAHsRNLg0b1AdUQuW-PoSQGcyaiLVeUe0LqBS79_GFZYNoz46Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sylvain,

On Thu, Sep 15, 2016 at 2:40 AM Sylvain LG <forum@sylvainlegourr.com> wrote:

> Hi,
>
> I've got a problem with systemd-timesyncd.
>
> The service is active:
>
> # systemctl status systemd-timesyncd
>> *?* systemd-timesyncd.service - Network Time Synchronization
>>    Loaded: loaded (/usr/lib/systemd/system/systemd-timesyncd.service;
>> enabled; vendor preset: enabled)
>>    Active: *active (running)* since Thu 2016-02-11 16:28:04 UTC; 1h 4min
>> ago
>>      Docs: man:systemd-timesyncd.service(8)
>>  Main PID: 257 (systemd-timesyn)
>>    Status: "Idle."
>>     Tasks: 2 (limit: 512)
>>    CGroup: /system.slice/systemd-timesyncd.service
>>            ??257 /lib/systemd/systemd-timesyncd
>
>
> Do you have any logs? You should be able to retrieve them with:
`journalctl -b -u systemd-timesyncd.service`? Also, do you use
systemd-networkd?

Thanks,
Gabe
-- 
Gabe Evans | Co-Founder & CTO
hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160915/7b95080d/attachment.html>
