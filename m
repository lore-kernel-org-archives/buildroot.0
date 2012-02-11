From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 19:29:26 +0200
Subject: [Buildroot] [PATCH] build: add 'file' option for 'make
	defconfig'
In-Reply-To: <201202111701.27270.arnout@mind.be>
References: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
 <201202111701.27270.arnout@mind.be>
Message-ID: <CAMP44s3yFDnDnQGEdYmXnVYTBt-jMd=6Cud5e0tzN2NE5fkB4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 11, 2012 at 6:01 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Saturday 11 February 2012 01:03:16 Felipe Contreras wrote:
>> So that this works:
>>
>> ?% make defconfig file=~/busybox-defconfig
>>
>> Right now we have to do:
>>
>> ?% make $PWD/output/build/buildroot-config/conf
>> ?% $PWD/output/build/buildroot-config/conf --defconfig=~/busybox-defconfig Config.in
>>
>> And the first command would through an error. Not nice.
>
> ?+1! ?And such a graceful solution too!
>
> ?One remark, though: we normally use capitals for variables. ?Also I'd make
> it more clear that the file means the defconfig file, so you can write:
>
> make DEFCONFIG=~/my-buildroot.config defconfig world

I find it a bit redundant. Maybe FILE.

Cheers.

-- 
Felipe Contreras
