From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 6 May 2014 14:26:31 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
In-Reply-To: <20140506140745.1b072d2c@skate>
References: <0533846efc9952901283.1399373479@argentina>
 <20140506140745.1b072d2c@skate>
Message-ID: <CAAXf6LXWCeGiH9bNsM=qaJ2bzH9RyOzu3FZpGxsmBsQyxHQMgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 6, 2014 at 2:07 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Tue, 06 May 2014 12:51:19 +0200, Thomas De Schampheleire wrote:
>> This patch causes the log messages to change from:
>>
>> >>> toolchain-external undefined Downloading
>> >>> toolchain-external undefined Extracting
>> ...
>>
>> to
>>
>> >>> toolchain-external virtual Downloading
>> >>> toolchain-external virtual Extracting
>> ...
>>
>> and similar for 'toolchain' and 'toolchain-buildroot', simply because it
>> looks nicer.
>> At the same time, the directory names also become toolchain-virtual,
>> toolchain-buildroot-virtual, toolchain-external-virtual instead of the
>> corresponding 'undefined' variants.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Shouldn't we instead migrate these to use the virtual package
> infrastructure, and make this infrastructure define this magic 'virtual'
> version?

For toolchain and toolchain-buildroot that would be possible, but for
toolchain-external not, right?

Thanks,
Thomas
