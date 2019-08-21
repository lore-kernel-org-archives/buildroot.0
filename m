From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2019 23:13:34 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libmicrohttpd: bump to
 version 0.9.66
In-Reply-To: <e5cf325b-7495-affe-6180-8291ab066fb2@koncepto.io>
References: <1565878960-17760-1-git-send-email-pjtexier@koncepto.io>
 <87k1b9g1kg.fsf@dell.be.48ers.dk>
 <e5cf325b-7495-affe-6180-8291ab066fb2@koncepto.io>
Message-ID: <e14c0bd6-3180-4002-5ba6-12b197e6ec34@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/08/2019 20:38, Pierre-Jean Texier wrote:
> Hi Peter,
> 
> Le 19/08/2019 ? 07:35, Peter Korsgaard a ?crit?:
>> Does this not belong on master? According to the release notes it is a
>> bugfix release:
> 
> Indeed, you're right it is a bugfix release.
> In fact, I wasn't totally sure between master and next.

 OK, cherry-picked to master, thanks.

 Regards,
 Arnout

> 
> Sorry for that :/
> 
> Thanks
> 
> Pierre-Jean
> 
>>
>> This is a bugfix release.
>>
>> Notable changes since version 0.9.65:
>> * Added callback to allow OCSP stapling (NEW)
>> * Fixed 0.9.64 regression breaking key-value pair lookups
>> ?? via MHD_lookup_connection_value() involving bitmasks
>> * Fixed hang when combining epoll, https and protocol upgrade
>> ?? (such as WebSockets) with larger messages
>> * Fixed potential connection hang when client included upload
>> ?? data in non-POST/PUT requests
>>
>> And so was 0.9.65:
> 
