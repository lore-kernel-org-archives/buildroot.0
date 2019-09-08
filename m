From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Sep 2019 17:26:25 +0200
Subject: [Buildroot] [PATCH v4 1/1] libuwsc: new package
In-Reply-To: <27b89946-3fdd-ca06-a710-e37f52020712@mind.be>
References: <CAGN0SiHWg3eZ_=2HJnLd6ACODH5WAXTTNBBPZCnW4=t8MMQCzA@mail.gmail.com>
 <27b89946-3fdd-ca06-a710-e37f52020712@mind.be>
Message-ID: <28e9ef6c-2ddf-0229-72bd-3ef0b5435c2c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/09/2019 17:24, Arnout Vandecappelle wrote:
>  Hi Zhao,
> 
>  Thank you for this new version.
> 
> On 08/09/2019 14:54, ??? wrote:
>> Signed-off-by: ??? <zhaojh329@gmail.com>
>>
>> ---
>> Changes v3 -> v4:
>>   - perfect configuration (suggested by Baruch Siach)
> 
>  That was the change from v2 -> v3. What has changed in this version compared to v3?
> 
>> ---
>>  package/Config.in            |  1 +
>>  package/libuwsc/Config.in    |  8 ++++++++
>>  package/libuwsc/libuwsc.hash |  3 +++
>>  package/libuwsc/libuwsc.mk   | 34 ++++++++++++++++++++++++++++++++++

 One more thing: please add yourself to the DEVELOPERS file [1] for this package.


 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#DEVELOPERS
