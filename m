From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 07 Apr 2017 07:35:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.77
References: <20170404212302.9793-1-bernd.kuhls@t-online.de>
 <20170406223304.7e2ecb6f@free-electrons.com>
Message-ID: <f1ljrdxu37.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 06 Apr 2017 22:33:04 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Tue,  4 Apr 2017 23:23:02 +0200, Bernd Kuhls wrote:
>> Added md5, sha1 & sha512 hashes.
> 
> Why? Having four hashes is not very useful. So I've kept only the sha512
> hash.

Hi Thomas,

because the docs say so:

http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-
hash

> If upstream provides more than one type of hash (e.g. sha1 and sha512),
> then it is best to add all those hashes in the .hash file.

Regards, Bernd
