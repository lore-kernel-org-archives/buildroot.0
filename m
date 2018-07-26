From: David De Grave <david.degrave@mind.be>
Date: Thu, 26 Jul 2018 11:55:52 +0200
Subject: [Buildroot] [PATCH v1 1/2] dtc: bump version to 1.4.7
Message-ID: <CAD6XyYx8rZNKdqMMBP_3+sDr2sD=1ztEWwr9BJ78sjq6nEVpDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Geoff, Thomas,

> On Tue, 24 Jul 2018 19:32:17 +0000, Geoff Levand wrote:
>> Bump from 1.4.4 to 1.4.7.
>>
>> Signed-off-by: Geoff Levand <geoff@infradead.org>
>> ---
>>  package/dtc/dtc.hash | 2 +-
>>  package/dtc/dtc.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)

> Applied to master, thanks.
> Thomas

I was going to submit exactly the same patch...
However during my tests, I noticed that except for the 1.4.4 version, all
the next ones are failing.
It produces a LOT of warnings and fails with

error: redefinition of ?fdt16_to_cpu'

And many other ones...

I didn't found a way to fix that right now...

Regards,
David.

--

David De Grave
Senior Embedded Software Developer
Gsm : +32(0)496.364.960 | Tel : +32-16-28.65.00 | Fax : +32-16-28a.65.01
Essensium-Mind - Gaston Geenslaan 9, B-3001 Leuven, Belgium
>>> Visit our new website: https://www.mind.be/ <<<
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180726/bbe693e9/attachment.html>
