From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 9 May 2013 08:34:00 -0500
Subject: [Buildroot] [PATCH 1/3] libglib2: Bump libglib2 to 0.36.1
In-Reply-To: <20130509110715.1716027f@skate>
References: <1368056050-19285-1-git-send-email-spenser@gillilanding.com>
 <20130509110715.1716027f@skate>
Message-ID: <CAEBucnAe0Q2iUJYviBUb-6cPzmL+LS_H7HTeZwPn1UsAsTSmrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> diff --git a/package/libglib2/libglib2-no-tests.patch b/package/libglib2/libglib2-no-tests.patch
>> deleted file mode 100644
>> index 81b5af2..0000000
>> --- a/package/libglib2/libglib2-no-tests.patch
>> +++ /dev/null
>> @@ -1,117 +0,0 @@
>> -Add a --disable-tests option to the configure script
>> -
>> -Disabling the build of tests has two benefits:
>> - * Prevents the build of a lot of code that doesn't build on noMMU
>> -   platforms.
>> - * Reduces the build time.
>> -
>> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Was this patch merged upstream? From the below I see to understand they
> added --disable-modular-tests, does it disable all tests?

It looks like a different patch but it is in the mainline and
--disable-modular-tests enables it.

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
