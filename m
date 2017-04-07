From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Apr 2017 13:26:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.77
In-Reply-To: <f1ljrdxu37.ln2@ID-313208.user.individual.net>
References: <20170404212302.9793-1-bernd.kuhls@t-online.de>
 <20170406223304.7e2ecb6f@free-electrons.com>
 <f1ljrdxu37.ln2@ID-313208.user.individual.net>
Message-ID: <8f23212c-2da8-3069-998b-99d35757d0b3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-04-17 07:35, Bernd Kuhls wrote:
> Am Thu, 06 Apr 2017 22:33:04 +0200 schrieb Thomas Petazzoni:
> 
>> Hello,
>>
>> On Tue,  4 Apr 2017 23:23:02 +0200, Bernd Kuhls wrote:
>>> Added md5, sha1 & sha512 hashes.
>>
>> Why? Having four hashes is not very useful. So I've kept only the sha512
>> hash.
> 
> Hi Thomas,
> 
> because the docs say so:
> 
> http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-
> hash
> 
>> If upstream provides more than one type of hash (e.g. sha1 and sha512),
>> then it is best to add all those hashes in the .hash file.

 Yep, I agree with the docs here. For sure, if upstream offers sha512, we should
at least also have sha512.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
