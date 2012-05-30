From: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Date: Wed, 30 May 2012 08:49:25 +0300 (EEST)
Subject: [Buildroot] [PATCH] quota: new package (v2)
In-Reply-To: <2003dbf485cd1a69315918348cd65514@zacarias.com.ar>
References: <1338324748-27437-1-git-send-email-jarkko.sakkinen@intel.com>
 <2003dbf485cd1a69315918348cd65514@zacarias.com.ar>
Message-ID: <alpine.DEB.2.02.1205300848400.3644@jsakkine-mobl2.(null)>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Tue, 29 May 2012, Gustavo Zacarias wrote:

> On 2012-05-29 17:52, Jarkko Sakkinen wrote:
>
>> --- a/fs/skeleton/etc/network/interfaces
>> +++ b/fs/skeleton/etc/network/interfaces
>> @@ -2,3 +2,5 @@
>>  auto lo
>>  iface lo inet loopback
>> 
>> +auto eth0
>> +iface eth0 inet dhcp
>
> Oops? It shouldn't be touching this file.

Sorry about, slipped in by mistake. I revised it soon after
sending this:

http://patchwork.ozlabs.org/patch/161803/

>
>> +QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
>
> Not strictly necessary, it's the default, though it's a minor detail.
> Regards.
>

/Jarkko
