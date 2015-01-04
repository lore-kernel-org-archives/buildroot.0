From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 04 Jan 2015 12:56:17 +0100
Subject: [Buildroot] [PATCH 10/10] package/dvb-app: remove tests
In-Reply-To: <20150102132628.6cef7d66@free-electrons.com>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>	<1419717508-11627-11-git-send-email-romain.naour@openwide.fr>
 <20150102132628.6cef7d66@free-electrons.com>
Message-ID: <54A92A61.1080206@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/01/2015 13:26, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sat, 27 Dec 2014 22:58:28 +0100, Romain Naour wrote:
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/dvb-apps/0004-Makefile-remove-test.patch | 27 ++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch
> 
> Ok, now I understand why patch 09/10 was not working.
> 
> If patch 09/10 needs patch 10/10 to work, then patch 10/10 needs to be
> *before* patch 09/10 in the series, or be squashed into it.

My bad, I haven't reordered these patches.
I have sent them in the same order I commited locally...
Ok, I'll squash them.

> 
> Patch rejected, please resend an updated version.
> 
> Also, if you could send to upstream dvb-apps those patches (and the
> other ones we have), it would be great.
> 
Ok, I'll send patches upstream.

Best regards,
Romain
