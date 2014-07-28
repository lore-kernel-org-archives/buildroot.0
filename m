From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Mon, 28 Jul 2014 18:56:13 +0200
Subject: [Buildroot] [PATCH v3 1/3] libgtk3: new package
In-Reply-To: <498367e8-7989-442b-91e1-89b6d2c2cb62@email.android.com>
References: <1406565218-12653-1-git-send-email-hadrien.boutteville@gmail.com>
 <1406565218-12653-2-git-send-email-hadrien.boutteville@gmail.com>
 <498367e8-7989-442b-91e1-89b6d2c2cb62@email.android.com>
Message-ID: <53D680AD.1080308@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 28 Jul 2014 18:41:08 +0200, Thomas De Schampheleire wrote:
[...]
>> +config BR2_PACKAGE_LIBGTK3_DEMO
>> +	bool "Install libgtk3 demo program"
>> +	help
>> +	  The GTK+ source base contains demo programs. This
>> +	  option allows to install this program to the target.
> 
> 'programs' in the first sentence conflicts with 'this program' in the second. 'them' as below sounds better...

Indeed, modified copy-paste from libgtk2 not carefully reviewed on my
side...

>> +
>> +config BR2_PACKAGE_LIBGTK3_TESTS
>> +	bool "Install libgtk3 tests"
>> +	help
>> +	  The GTK+ source base contains tests. This option
>> +	  allows to install them to the target.
>> +
>> +endif

Regards,

Hadrien
