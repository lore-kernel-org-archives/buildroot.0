From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 19:12:34 -0300
Subject: [Buildroot] [PATCH v5 4/6] vala: bump to version 0.28.0
In-Reply-To: <20150714235457.25e274b9@free-electrons.com>
References: <1436902975-5004-1-git-send-email-gustavo@zacarias.com.ar>	<1436902975-5004-5-git-send-email-gustavo@zacarias.com.ar>
 <20150714235457.25e274b9@free-electrons.com>
Message-ID: <55A58952.20505@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/15 18:54, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
>
> On Tue, 14 Jul 2015 16:42:53 -0300, Gustavo Zacarias wrote:
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>   package/vala/vala.hash | 4 ++--
>>   package/vala/vala.mk   | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> Applied, thanks.

I haven't tested but this may break current midori, so revert in case it 
does (it even breaks 0.5.9 without patching).
gmpc is not affected though.
Regards.
