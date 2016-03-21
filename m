From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Mar 2016 08:43:20 -0300
Subject: [Buildroot] [PATCH v3 2/7] libgtk3: bump to version 3.18.8
In-Reply-To: <20160320183749.20bd3132@free-electrons.com>
References: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
 <1457517525-7716-3-git-send-email-gustavo@zacarias.com.ar>
 <20160320183749.20bd3132@free-electrons.com>
Message-ID: <56EFDE58.3020309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/16 14:37, Thomas Petazzoni wrote:

> Hello,
>
> On Wed,  9 Mar 2016 06:58:40 -0300, Gustavo Zacarias wrote:
>> Mark the wayland backend as good again since the bump and consequent
>> protocol version mtach fixes it.
>>
>> Switch backend selection to choice so that only one can be selected.
>
> Where are you doing this? I don't see the backend selection being
> changed to a kconfig "choice". Did I miss something?

Hi.
I had a change of heart and forgot to update the comment.
It is indeed possible to have multiple backends at once and switch via 
the GDK_BACKEND env variable.
I'll spin a new set together with the 3.18.9 bump (3.20.x is due right 
now, but is known to have some kinks on the API side so it might be 
better to get on it a bit later).
Regards.
