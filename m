From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 5 Apr 2014 18:35:12 +0400
Subject: [Buildroot] host-binutils broken?
In-Reply-To: <CAMo8Bf+twN0uqjLquE7GYVpf1CP0UndHy924Ome3c84dqP4Y0A@mail.gmail.com>
References: <533EED51.9090204@freescale.com>
 <CAMo8BfJhxpqBFmFeADF97cKbANtzNFYy2_L=wrMjLn8zUtinyw@mail.gmail.com>
 <loom.20140404T230545-334@post.gmane.org>
 <CAMo8BfKN8NAsfS1aM31TzjUvfJ1EFRQTZVnxH4U2M0BN0XWq1A@mail.gmail.com>
 <533FF599.70104@bergerie>
 <CAMo8Bf+twN0uqjLquE7GYVpf1CP0UndHy924Ome3c84dqP4Y0A@mail.gmail.com>
Message-ID: <CAMo8BfJZbpLA0VhG08bKT5OYvmNydEYJ_TW-FUU9oBpsdKjV+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 5, 2014 at 6:04 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Sat, Apr 5, 2014 at 4:22 PM, Vincent <vincent.stehle@laposte.net> wrote:
>> On 04/05/2014 12:46 AM, Max Filippov wrote:
>>> What's your makeinfo version?
>> This is:
>>
>>   makeinfo (GNU texinfo) 5.2
>>
>> ...on debian testing, from package texinfo 5.2.0.dfsg.1-2.
>
> Ok, I'll try this version (I currently have 4.13 on build machine).

Yes, now make as.info fails for me too. However, it fails for me both
with and without
my patch. Seems to me the easiest fix would be to drop *.texi hunks from my
patch to binutils to just avoid as.info rebuild. Ok?

-- 
Thanks.
-- Max
