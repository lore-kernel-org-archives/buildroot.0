From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 17 Oct 2016 07:08:49 -0300
Subject: [Buildroot] [PATCH 2/8] adwaita-icon-theme: install to staging
In-Reply-To: <20161016181520.4f8b4ea1@free-electrons.com>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
 <1476321239-13894-2-git-send-email-gustavo@zacarias.com.ar>
 <20161016181520.4f8b4ea1@free-electrons.com>
Message-ID: <5ff81c29-dec0-4e89-0232-18f16d1068e1@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/16 13:15, Thomas Petazzoni wrote:

> Hello,
>
> On Wed, 12 Oct 2016 22:13:53 -0300, Gustavo Zacarias wrote:
>> This is required for the upcoming evince package.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  package/adwaita-icon-theme/adwaita-icon-theme.mk | 1 +
>>  1 file changed, 1 insertion(+)
>
> It feels a bit odd that evince needs icons in the staging directory.
> Could you improve the commit message a bit to explain why this is
> needed?
>
> Thanks!
>
> Thomas

Hi.
It's actually very simple, evince checks for adwaita icons via 
pkgconfig, hence  if they're not installed in staging they're not found.
Should i resend the series or just this one?
Regards.
