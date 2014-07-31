From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Jul 2014 15:18:47 -0300
Subject: [Buildroot] [PATCH] libarchive: bump to version 3.1.2
In-Reply-To: <20140731201806.50aaaaf9@free-electrons.com>
References: <1406830232-27101-1-git-send-email-gustavo@zacarias.com.ar>
 <20140731201806.50aaaaf9@free-electrons.com>
Message-ID: <53DA8887.3090204@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/31/2014 03:18 PM, Thomas Petazzoni wrote:

>> +ifeq ($(BR2_PACKAGE_ACL),y)
>> +LIBARCHIVE_DEPENDENCIES += acl
> 
> No --enable-acl ?
> 
>> +else
>> +LIBARCHIVE_CONF_OPT += --disable-acl
>>  endif
>>  
>> +ifeq ($(BR2_PACKAGE_ATTR),y)
>> +LIBARCHIVE_DEPENDENCIES += attr
> 
> Same here and for all other options?

They're all enabled/auto by default.
Regards.
