From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Sat, 15 Nov 2008 07:06:39 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <1363312C-9914-45B9-9A58-86C6CB8AD38B@valka.is>
References: <20081111183231.E74AC3C989@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909CEAAE5@mi8nycmail19.Mi8.com>
	<20081112085548.105af9b2@surf>
	<1363312C-9914-45B9-9A58-86C6CB8AD38B@valka.is>
Message-ID: <e4c675870811142206p1100c2a6ha571f1fbe5a5ba1e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/12 Arnar Mar Sig <antab@valka.is>:
>
> On Nov 12, 2008, at 8:55 AM, Thomas Petazzoni wrote:
>
>> Le Tue, 11 Nov 2008 20:09:06 -0500,
>> "hartleys" <hartleys@visionengravers.com> a ?crit :
>>
>>> Each source file hit with CC produces a warning message. Everything
>>> hit with LD is fine. Here's a snip of the output:
>>>
>>> ...
>>> LD      lib/zlib_inflate/zlib_inflate.o
>>> LD      lib/zlib_inflate/built-in.o
>>> CC      lib/audit.o
>>> arm-linux-gcc: --rpath-link: linker input file unused because linking
>>> not done
>>> arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/lib:
>>> linker input file unused because linking not done
>>> arm-linux-gcc: --rpath-link: linker input file unused because linking
>>> not done
>>> arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/usr/
>>> lib:
>>> linker input file unused because linking not done
>>
>> Odd. I did try to build the kernel and didn't see this messages. I
>> will
>> try something else.
>>
>> Sincerly,
>>
>> Thomas
>
>
> This also happen when building for AVR32.

It happens in i586 too, please take a look to this report

http://busybox.net/bugs/view.php?id=6324

may be it is related with your changes.

 Ciao,
-- 
/roberto
