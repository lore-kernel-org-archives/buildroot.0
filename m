From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 14 Apr 2014 23:22:55 +0200
Subject: [Buildroot] [PATCH 4/5] host-python-pyrex: use the
 HOST_*_NEEDS_HOST_PYTHON infrastructure
In-Reply-To: <20140414231519.00bd7a70@skate>
References: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
 <1397509552-5278-5-git-send-email-s.martin49@gmail.com>
 <20140414231519.00bd7a70@skate>
Message-ID: <CAHXCMMJOJ+Dxg0tws94BUUKs6QFpqw3pHRHOTDECkovhAGVOmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 14, 2014 at 11:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Mon, 14 Apr 2014 23:05:51 +0200, Samuel Martin wrote:
>> This will automatically take care of adding the right host-python package
>> to the dependency list and it will avoid trying to build python-pyrex using
>> python3.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/python-pyrex/python-pyrex.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Did you actually verify the python-pyrex only works with Python 2 ?
> Your commit log doesn't even say that.

Yes, I did check it.
Sorry for missing this in the commit log :s
Do you mind add it when you'll apply the patch or should I repost it?

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
