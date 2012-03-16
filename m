From: Markus Kaindl <markus.kaindl@stusta.mhn.de>
Date: Fri, 16 Mar 2012 01:29:17 +0100
Subject: [Buildroot] [PATCH] Downloadsite DHCP changed
In-Reply-To: <20120315081046.5e88ba0a@skate>
References: <1331783706-15520-1-git-send-email-markus.kaindl@stusta.mhn.de>
 <20120315081046.5e88ba0a@skate>
Message-ID: <4F62895D.80704@stusta.mhn.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni schrieb:
> Hello Markus,
> 
> Excellent! You are almost there with your Git patch. You need to fix
> two final things:
> 
>  * The short description of the patch should rather describe what the
>    patch does rather than the reason why it does. Something like
>    "dhcp: update HTTP site location" or similar. But that's just a
>    matter of taste.
> 
>  * Our commit log must include a Markus Kaindl
>    <markus.kaindl@stusta.mhn.de> line. So basically, your commit log
>    should look like:
> 
> =====================================================================
> dhcp: update HTTP site location
> 
> Signed-off-by: Markus Kaindl <markus.kaindl@stusta.mhn.de>
> =====================================================================
> 
> And then your patch will be perfect.
> 
> I am sorry to be annoying about this, but those are the rules we all
> follow in the Buildroot community, and I think it is a good idea to
> explain them to new contributors.
> 
> Thanks for your work and persistence!
> 
> Thomas
> 
> Le Thu, 15 Mar 2012 04:55:06 +0100,
> Markus Kaindl <markus.kaindl@stusta.mhn.de> a ?crit :
> 
>> ---
>>  package/dhcp/dhcp.mk |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
>> index 10bdc2e..9ec27d3 100644
>> --- a/package/dhcp/dhcp.mk
>> +++ b/package/dhcp/dhcp.mk
>> @@ -5,7 +5,7 @@
>>  #############################################################
>>  
>>  DHCP_VERSION  = 4.1-ESV-R4
>> -DHCP_SITE     = http://ftp.isc.org/isc/dhcp
>> +DHCP_SITE     = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>>  DHCP_CONF_ENV = ac_cv_file__dev_random=yes
>>  DHCP_CONF_OPT = \
>>  	--localstatedir=/var/lib/dhcp \
> 
> 
> 

Hello Thomas,

Peter Korsgaard has fixed it himslef now, so I won't send another one ;)
But thanks for your advice, I'll try to make it right the next time.

Markus

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 900 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120316/75c7a307/attachment.asc>
