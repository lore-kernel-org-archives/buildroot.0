From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 29 Jan 2018 09:29:34 +0100
Subject: [Buildroot] [PATCH] package/gpsd: upgrade to 3.17,
 remove obsolete patch
In-Reply-To: <20180129080301.3x4ek2l3ogyraupn@sapphire.tkos.co.il>
References: <1517212625-32760-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20180129080301.3x4ek2l3ogyraupn@sapphire.tkos.co.il>
Message-ID: <37de60a2-28c9-4135-104c-d804ec73edf5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

On 01/29/2018 09:03 AM, Baruch Siach wrote:
> Hi Zoltan,
>
> On Mon, Jan 29, 2018 at 08:57:05AM +0100, Zoltan Gyarmati wrote:
>> The upstream patch which disables the build-time systemctl call made it into
>> this release so removing it here. Also adding hash for the COPYING file.
>>
>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> ---
>>  ...001-SConstruct-do-not-force-O2-by-default.patch | 29 +++++++++++++++
>>  ...eract-with-systemctl-when-cross-compiling.patch | 41 ----------------------
>>  ...002-SConstruct-do-not-force-O2-by-default.patch | 29 ---------------
>>  package/gpsd/gpsd.hash                             |  3 +-
>>  package/gpsd/gpsd.mk                               |  2 +-
>>  5 files changed, 32 insertions(+), 72 deletions(-)
>>  create mode 100644 package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch
>>  delete mode 100644 package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch
>>  delete mode 100644 package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch
> It looks like the -O2 patch file is just renamed. To make this apparent it 
> would be better to pass -M to 'git format-patch', so that git would detect the 
> file rename. This also makes the patch review easier, especially when the file 
> is also changed along the way.
Indeed. Thanks for the review, i resent a v1.
>
> baruch
>

Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180129/bc06ae93/attachment.asc>
