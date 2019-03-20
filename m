From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 10:23:55 +0100
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
In-Reply-To: <CADvTj4q9+uWVE-Yooj7gwVygHca0Y8KiKoHUBtRruf2jzyi8mQ@mail.gmail.com>
References: <20190319114156.10696-1-esben.haabendal@gmail.com>
 <87mulqebah.fsf@dell.be.48ers.dk>
 <f11c03b3-7edd-5c55-7287-61684f2c9a64@mind.be>
 <87imwdexcs.fsf@dell.be.48ers.dk>
 <CADvTj4q9+uWVE-Yooj7gwVygHca0Y8KiKoHUBtRruf2jzyi8mQ@mail.gmail.com>
Message-ID: <a2d3ff44-26a3-85d6-389e-c0eb9ff8448d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/03/2019 10:05, James Hilliard wrote:
> On Wed, Mar 20, 2019 at 2:58 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>>
>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
[snip]
>>  >  In the few projects where I've seen openssh used, it was always with a custom
>>  > config file. Otherwise, there's not much reason to use openssh instead of
>>  > dropbear I guess.
>>
>> Indeed. I always use dropbear as well.
> One reason for using openssh instead of dropbear without a custom
> config would be
> for sftp support.

 ... which is why we have gesftpserver :-)

 Regards,
 Arnout
