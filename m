From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 09:40:43 +0100
Subject: [Buildroot] [git commit] cppdb: new package
In-Reply-To: <abe97ff0-f147-45a4-ac15-ce0802dc12f6@email.android.com> (Thomas
 De Schampheleire's message of "Mon, 11 Nov 2013 08:50:11 +0100")
References: <20131111005852.635979BBAE@busybox.osuosl.org>
 <abe97ff0-f147-45a4-ac15-ce0802dc12f6@email.android.com>
Message-ID: <8761rz8h6c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

>> +++ b/package/cppdb/Config.in
>> @@ -0,0 +1,15 @@
>> +config BR2_PACKAGE_CPPDB
>> +	bool "cppdb"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	# Can be built without them but it's useless
>> +	depends on BR2_PACKAGE_MYSQL_CLIENT || BR2_PACKAGE_SQLITE

> This dependency should also have been added on the comment, to make
> sure it is only shown when relevant...

Ahh yes, will fix.

-- 
Bye, Peter Korsgaard
