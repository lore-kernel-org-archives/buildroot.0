From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 05 Jul 2011 16:13:09 +0200
Subject: [Buildroot] [PATCH] New packages: acl and attr
In-Reply-To: <4E0DA5EC.90909@visionsystems.de>
References: <4E09922C.6060803@visionsystems.de>
 <20110628104841.731f2371@skate> <4E09D287.5060608@visionsystems.de>
 <20110628152455.0b2aa6a4@skate> <4E09D729.2040207@visionsystems.de>
 <BANLkTikj8vuZNKoiE=g7k3E02R8yPONRhg@mail.gmail.com>
 <4E0DA5EC.90909@visionsystems.de>
Message-ID: <4E131BF5.3000401@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>> These passages are needed because of non-conform installation routine
>>>>> (as far as I can see). Otherwise installation script would try to
>>>>> install the files to /usr/ directly.
>>>> This should not happen with autotools-based packages. Are you sure ?
>>> I know it shouldn't, but this is the behavior I observe.
>> It's weird indeed:
>> http://git.savannah.gnu.org/cgit/attr.git/tree/configure.in
>> http://git.savannah.gnu.org/cgit/attr.git/tree/Makefile
>> http://git.savannah.gnu.org/cgit/attr.git/tree/include/builddefs.in
> 
> Could we apply the patch as is, so we can move on with udev update? Meanwhile I'll try to contact the maintainers of acl and attr and discuss the issue with them.

This is a discussion with attr and acl devs: http://lists.gnu.org/archive/html/acl-devel/2011-07/threads.html#00001

Yegor
