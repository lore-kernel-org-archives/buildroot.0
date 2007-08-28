From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 28 Aug 2007 14:26:48 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atme
	l:	atngw100/target_skeleton atngw100/target etc...
In-Reply-To: <1188289279.7412.1.camel@localhost.localdomain>
References: <N6xhSnyYKJlG.yp1Ms24M@mailout.dof.se>
	<1188289279.7412.1.camel@localhost.localdomain>
Message-ID: <20070828122648.GB24891@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 28, 2007 at 10:21:19AM +0200, Hans-Christian Egtvedt wrote:
>
>On Tue, 2007-08-28 at 10:10 +0200, Ulf Samuelsson wrote:
>> > Added:
>> >    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/bin/
>> 
>> What is up with all the directories? Is not defining them
>> in .../<board>/device_table.txt enough? I find it far better defining
>> them there since the access permissions can be defined as well.
>> 
>> 
>> Some stuff are needed
>> during the build and
>> the device table is only
>> used when you convert
>> $(TARGET-DIR) to
>> rootfs-avr32.$(fs) which
>> is too late.
>> 
>> It can probably be done
>> better
>
>Indeed, the packages failing with an "empty" skeleton should have some
>mkdir -p actions in them IMHO. That way not all targets needs to be
>fixed, but just one package.

Yes, that's the proper thing to do, agree.
