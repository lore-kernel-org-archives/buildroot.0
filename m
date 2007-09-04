From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Wed, 05 Sep 2007 00:05:46 +0200
Subject: [Buildroot] Tar problems
Message-ID: <46DDD6BA.8020802@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I didn't send to ML. Sorry Ulf.

Hello Ulf,

Ulf Samuelsson wrote:


>>tis 2007-09-04 klockan 22:56 +0200 skrev Bernhard Fischer:
>>  
>>
>  
>
>>>>On Tue, Sep 04, 2007 at 03:24:37PM +0200, Babarovic Ivica wrote:
>>>>    
>>>>
>>    
>>
>>>>>>Since this is my first post to this list I'd like to say hello first and
>>>>>>express my appreciation
>>>>>>for this wonderful tool.
>>>>>>
>>>>>>This is the problem I'm getting while building my target.
>>>>>>I specifically uncheck the tar option for compressing rootfs. It seems
>>>>>>though build process
>>>>>>ignores this.
>>>>>>      
>>>>>>
>>>      
>>>
>>
>>Buildroot, up to late this summer did not delete the files generated
>>for use by fakeroot, so even if something was disabled, when
>>fakeroot was called, all the old stuff got processed again.
>>If htis is indeed the case, either an old version of buildroot is used,
>>or the problem remains lurking somewhere deep in the tree.
>>
>>
>>  
>>
>  
>
I'm using the latest version from svn repository. I got to the point
where I did a new clean checkout. However I used the old .config
file and did a 'make oldconfig'  first. Problem persisted.

Best regards!

-- 
Babarovic Ivica, R&D Engineer
ASIST avtomatizacija sistemov d.o.o.		Web: www.asist.si
Cesta Ljubljanske brigade 23a			Phone: +386 (1)5837 217
Ljubljana, Slovenija
