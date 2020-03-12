From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 12 Mar 2020 13:35:46 +0100
Subject: [Buildroot] [PATCH v3 3/3] package/linuxptp: update indentation
 of hash file
In-Reply-To: <CAJ4jsac2z3HGrLSOjpAQ5zWD1oERg7G+W1VxZzq4s7ee5+ygMQ@mail.gmail.com>
References: <20200310080722.12742-1-heiko.thiery@gmail.com>
 <20200310080722.12742-4-heiko.thiery@gmail.com>
 <CAJ4jsac2z3HGrLSOjpAQ5zWD1oERg7G+W1VxZzq4s7ee5+ygMQ@mail.gmail.com>
Message-ID: <7cabd46d-2475-f1ad-0298-93b3fc431554@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On 3/12/20 1:24 PM, Carlos Santos wrote:
> On Tue, Mar 10, 2020 at 5:08 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>>
>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>> ---
>>   package/linuxptp/linuxptp.hash | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
>> index 5e6c7741cd..d04be1f655 100644
>> --- a/package/linuxptp/linuxptp.hash
>> +++ b/package/linuxptp/linuxptp.hash
>> @@ -1,9 +1,9 @@
>>   # From https://sourceforge.net/projects/linuxptp/files/v2.0/
>> -sha1 592ca42c6146a79c1fcabed7c19fa7af4803d4f6  linuxptp-2.0.tgz
>> -md5 d8bb7374943bb747db7786ac26f17f11  linuxptp-2.0.tgz
>> +sha1  592ca42c6146a79c1fcabed7c19fa7af4803d4f6  linuxptp-2.0.tgz
>> +md5  d8bb7374943bb747db7786ac26f17f11  linuxptp-2.0.tgz
>>
>>   # Locally computed:
>> -sha256 0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d  linuxptp-2.0.tgz
>> +sha256  0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d  linuxptp-2.0.tgz
>>
>>   # Hash for license file:
>> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> 
> Is the current indentation causing any problem? If not, I'd leave this
> change to be made in a package version bump.
> 

No there is no problem. We just can ignore this commit.


-- 
Heiko
