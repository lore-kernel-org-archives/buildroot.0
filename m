From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 20 Oct 2014 23:24:00 +0200
Subject: [Buildroot] [PATCH] eudev: add input group
In-Reply-To: <20141020231802.204b1e27@free-electrons.com>
References: <1413838745-14008-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020231802.204b1e27@free-electrons.com>
Message-ID: <CAHXCMMLC+ZuqeOWkWV2d7BfZaWsCg+aohcTe9ZP3M85kn-qExQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 20, 2014 at 11:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gustavo Zacarias,
>
> On Mon, 20 Oct 2014 17:59:05 -0300, Gustavo Zacarias wrote:
>> It's used by 50-default-udev.rules for input-class devices.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  package/eudev/eudev.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> I've seen the same issue a couple of days ago.
>
> Does systemd needs a similar fix?

I think so.

It is not that much about systemd, but more about udev rules that
would try to set the ownership to some group that does not exist.

Regards,

-- 
Samuel
