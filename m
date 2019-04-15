From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Apr 2019 19:41:41 +0200
Subject: [Buildroot] New Package: Entware
In-Reply-To: <CALtfCQbpS+ek8ZZcsECyzRV+L+=T4L6a6ER+wkqjNrLqpoNNZw@mail.gmail.com>
References: <CALtfCQZa9OH-LFC12DtAV=3Ff9wMphcLhBmNyeRqmym7BsFAJw@mail.gmail.com>
 <50885bb4-64a7-e6bc-36e2-ac468050df3a@mind.be>
 <bf8f0cba-e376-d800-df1f-8b44581a2f4c@mind.be>
 <CALtfCQY6aaSU-hq3P_z1avXs7g6LUx7VanA12bp84rDovuGGVw@mail.gmail.com>
 <26bced5d-984a-ae0e-5e91-d42df957afa5@mind.be>
 <CALtfCQbpS+ek8ZZcsECyzRV+L+=T4L6a6ER+wkqjNrLqpoNNZw@mail.gmail.com>
Message-ID: <84ea6c9d-4923-fae8-9427-dbec5798e7fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2019 19:18, Oscar Gomez Fuente wrote:
> On Sun, 14 Apr 2019 at 21:55, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>  I don't get it. Entware is a (kind of) distro that uses opkg. It's like saying
>> apt is old-fashioned and Ubuntu is cool... Entware is essentially an opkg.conf file.
>>
> 
> I'm sorry I meant to say Optware instead fo opkg. But You are right, I
> misunderstood the meaning of Entware when I was reading the wiki on
> github:
> 
> https://github.com/Entware/Entware/wiki
> 
> Besides, It doesn't make sense to create a new package for Entware If
> we have the package opkg.

 Actually, you can entware as-is on a busybox installation, as long as /opt is
writeable. Entware will install opkg and libc in /opt and will handle everything
from there.

 Regards,
 Arnout
