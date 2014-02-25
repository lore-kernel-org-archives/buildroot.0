From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 25 Feb 2014 21:32:43 +0100
Subject: [Buildroot] [PATCH v2 2/2] systemd: enable required kernel
	features.
In-Reply-To: <530CCD06.3070008@mind.be>
References: <1393233942-11638-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393233942-11638-3-git-send-email-eric.le.bihan.dev@free.fr>
 <530CCD06.3070008@mind.be>
Message-ID: <CAHXCMMJamG_ku6OU9CCG8bgnpwiDHhLrtMcFi=L1eqCRoBR3uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 25, 2014 at 6:04 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 24/02/14 10:25, Eric Le Bihan wrote:
>> When systemd is chosen as init system, the required kernel features are
>> enabled.
>>
>> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

>
>  However, it would be good to add the same information to the end of
> docs/manual/configure.txt

May be good indeed, but it can be done in another patch.


Regards,

-- 
Samuel
