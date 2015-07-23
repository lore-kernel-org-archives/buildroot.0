From: Martin Bark <martin@barkynet.com>
Date: Thu, 23 Jul 2015 23:34:13 +0100
Subject: [Buildroot] [v2 1/4] package/redis: Add redis system user
In-Reply-To: <20150723232521.4031d2c0@free-electrons.com>
References: <1437650429-13748-1-git-send-email-martin@barkynet.com>
 <20150723232521.4031d2c0@free-electrons.com>
Message-ID: <CAFGQKxe-jv5PncLDu-NEmY5p0Aa6uFqDaFq9mKs5gPAUxat6cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23 July 2015 at 22:25, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Martin Bark,
>
> On Thu, 23 Jul 2015 12:20:26 +0100, Martin Bark wrote:
>> Add a redis system user and set the home directory to /var/lib/redis
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>>
>> ---
>> Changes v1 -> v2
>>  - Set redis user shell to /bin/false (Suggested by Thomas Petazzoni)
>>  - Removed $(INSTALL) of /var/lib/redis (Suggested by Thomas Petazzoni)
>> ---
>>  package/redis/redis.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>
> All four patches applied, thanks!
>
> Thomas

Thanks Thomas

> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
