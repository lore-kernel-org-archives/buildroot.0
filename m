From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 8 Jun 2016 23:29:02 +0200
Subject: [Buildroot] [PATCH 1/3] pckage/openpowerlink: fix sha256 hash
In-Reply-To: <20160608232510.78ab03df@free-electrons.com>
References: <1465420919-3920-1-git-send-email-romain.naour@gmail.com>
 <20160608232510.78ab03df@free-electrons.com>
Message-ID: <a0e1efad-93f2-0d08-8afc-18deb9d02d3e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/06/2016 ? 23:25, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Wed,  8 Jun 2016 23:21:57 +0200, Romain Naour wrote:
>> While bumping to v2.4.0, the sha256 was commented by mistake
>> and the hash was for v2.3.2 archive.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/openpowerlink/openpowerlink.hash | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> All three patches applied, thanks! There was a typo in the title of
> this patch, which I fixed when applying.

Thanks, I'm working with upstream for the next bug fix release (2.4.1) to
upstream most of the patches.

Patch 5 and 6 are already upstream.

Best regards,
Romain

> 
> Thomas
> 
