From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 11 Mar 2008 09:11:24 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: package
References: <20080310152243.544A212C5F4@busybox.net>
	<877iga5yy6.fsf@macbook.be.48ers.dk>
	<007c01c882ec$733d2960$080514ac@atmel.com>
	<87wsoa1fpk.fsf@macbook.be.48ers.dk>
	<00ab01c882f4$1dd68bd0$080514ac@atmel.com>
	<87d4q21daj.fsf@macbook.be.48ers.dk>
	<01a201c882fb$c8bab2e0$080514ac@atmel.com>
	<d6cda7730803101624s42b8287fv442221977d21584d@mail.gmail.com>
Message-ID: <02fa01c88353$7aee2210$090514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




> >
>>  nodevfiles:
>>
>>             rm -rf $(TARGET_DIR)/usr/include
>>
>>             find $(TARGET_DIR)/usr/lib -name '*.a' -delete
>>
>>  Then the user can make his own decisions.
>>  The packages will not add any ".a" packages,
>>  and none will be deleted, unless the user wishes them to be.
> 
> Provided he actually reads this mailling list. IMHO we already have
> too many magic targets.

If a separate configuration was added to clean out the directory,
then that problem is solved.


Best Regards
Ulf Samuelsson
