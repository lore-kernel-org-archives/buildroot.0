From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Sun, 12 Feb 2017 16:00:07 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <20170212154145.1def8a2c@free-electrons.com>
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
 <20170212154145.1def8a2c@free-electrons.com>
Message-ID: <0f4181a3-ea43-79e3-6cae-2bd339cc88b9@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 12.02.2017 15:41, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 12 Feb 2017 03:04:44 +0100, Marcus Hoffmann wrote:
> 
>> -CLASSPATH_VERSION = 0.98
>> +CLASSPATH_VERSION = 0.99
>>  CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
>>  CLASSPATH_CONF_OPTS = \
>>  	--disable-examples \
>> -	--disable-plugin \
>>  	--disable-rpath \
>>  	--disable-Werror \
>>  	--disable-gconf-peer \
>> -	--disable-tools
>> +	--disable-gjdoc
> 
> There was a typo here: missing final backslash. Due to this, Buildroot
> could not build this package at all. Did you test it before submitting
> the patch? :-)

I let it run through the test-pkg script. And then I think I reordered
some lines before the final commit... :-/ Sorry about that.

I saw you fixed it already. Thanks, and sorry again!

> 
>> +	--enable-tools
> 
> Thanks!
> 
> Thomas
> 

Marcus
