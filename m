From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 29 Nov 2017 23:54:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/supertuxkart: bump to 0.9.3
In-Reply-To: <20171129234509.1f37baa9@windsurf.home>
References: <20171129222931.17511-1-romain.naour@gmail.com>
 <20171129222931.17511-2-romain.naour@gmail.com>
 <20171129234509.1f37baa9@windsurf.home>
Message-ID: <49b1af5a-3a78-1f86-2c3c-200212b7064b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 29/11/2017 ? 23:45, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Wed, 29 Nov 2017 23:29:31 +0100, Romain Naour wrote:
>> Remove upstream patches.
>>
>> See: http://blog.supertuxkart.net/2017/11/supertuxkart-093-released.html
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  ...001-irrlicht-Get-rid-of-unprefixed-cflags.patch | 34 -------------------
>>  ...x-boolean-return-type-for-jpeglib-s-callb.patch | 39 ----------------------
>>  package/supertuxkart/supertuxkart.hash             |  8 ++---
>>  package/supertuxkart/supertuxkart.mk               |  6 ++--
>>  4 files changed, 8 insertions(+), 79 deletions(-)
>>  delete mode 100644 package/supertuxkart/0001-irrlicht-Get-rid-of-unprefixed-cflags.patch
>>  delete mode 100644 package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch
> 
> This doesn't apply to the next branch. Could you look why, and resend
> rebased on the next branch?

This patch is based on the next branch, I think it's a patchwork issue (line ending)

http://code.bulix.org/j236x2-233444?raw

Sorry, I can't do anything.
The patch must be fixed while applying :-/

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
