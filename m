From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Sep 2015 16:18:12 +0100
Subject: [Buildroot] [PATCH v14 1/1] squeezelite: new package
In-Reply-To: <201509301434.t8UEYCh2003625@ms-omx01.plus.so-net.ne.jp>
References: <201509301434.t8UEYCh2003625@ms-omx01.plus.so-net.ne.jp>
Message-ID: <560BFD34.3020409@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On 09/30/2015 03:34 PM, kei-k at ca2.so-net.ne.jp wrote:
> Dear all.
> 
> I will appreciate if you point out anything I should improve for
> following patch.
> 
> Thanks,
> Kawashima
> 
>> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
>> ---
>> Changelog
>> v13 -> v14
>> - change to use patch file insted of using sed to generate Makefile.

[snip]

>> v12 -> v13
>> - change SQUEEZELITE_SITE to github (mine), cloned from original
>>   google code site (original site is unstable to fetch).

So you own a clone of that project on github, and the package you want
to add in Buildroot clones from it. Great! Then, why not...

[snip]

>> - to accomplish above, change to generate buildroot suitable Makefile from
>>   original squeezelite's Makefile (using 'override' directive for CFLAGS,
>>   LDFLAGS).

...fix the Makefile upstream (your github repo) instead of adding a
patch in Buildroot?

Regards,

Vincent.

[snip]
