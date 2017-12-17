From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 17 Dec 2017 10:42:14 +0100
Subject: [Buildroot] [PATCH 3/3] package/shapelib: version bump,
 use the new autotools build config and add new dependency on proj
In-Reply-To: <20171217103244.0547496d@windsurf>
References: <1513468381-8875-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1513468381-8875-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20171217103244.0547496d@windsurf>
Message-ID: <2f9c14a0-7bbe-9522-8b2c-b0b3545013d5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas&Baruch,

great, thanks for the review and the tweaks!


Regards,

Zoltan Gyarmati
https://zgyarmati.de

On 12/17/2017 10:32 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Sun, 17 Dec 2017 00:53:01 +0100, Zoltan Gyarmati wrote:
>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> ---
>>  package/shapelib/Config.in     |  5 +++++
>>  package/shapelib/shapelib.hash |  2 +-
>>  package/shapelib/shapelib.mk   | 17 +++--------------
>>  3 files changed, 9 insertions(+), 15 deletions(-)
> I've applied, after adding the thread dependency (as noticed by Baruch)
> and tweaking the commit log (your commit title was too long).
>
> Thanks!
>
> Thomas


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171217/c3541d62/attachment.asc>
