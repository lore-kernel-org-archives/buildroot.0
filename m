From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Mon, 03 Sep 2012 23:07:10 +0300
Subject: [Buildroot] Bash string manipulation in Kconfig
In-Reply-To: <20120903220143.42e0c095@skate>
References: <5044FD5F.102@petroprogram.com> <20120903210830.71b3372b@skate>
 <50450AD0.3060703@petroprogram.com> <20120903220143.42e0c095@skate>
Message-ID: <50450DEE.5040601@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

3.9.2012 23:01, Thomas Petazzoni kirjoitti:
> Le Mon, 03 Sep 2012 22:53:52 +0300,
> Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :
>
>> for i in $(FULL_DOWNLOAD_URL);do \
>>     echo $(notdir $$i) ; \
> Inside this for loop, what you're writing is shell code, not make code.
>
> Thomas
And because that notdir is buildroot make construct I can't use it
inside for-loop ?
Can you suggest another way to extract file part from variable that
contains bunch of URL's in for-loop ?

Stefan
