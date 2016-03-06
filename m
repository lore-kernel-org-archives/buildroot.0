From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 6 Mar 2016 23:52:12 +0100
Subject: [Buildroot] [PATCH v2 5/5] legal-info: explicitly state how
 patches are licensed
In-Reply-To: <20160306161444.1f97fdf7@free-electrons.com>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-6-git-send-email-luca@lucaceresoli.net>
 <20160306161444.1f97fdf7@free-electrons.com>
Message-ID: <56DCB49C.5020102@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas, Yann,

On 06/03/2016 16:14, Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
> 
> On Mon,  1 Feb 2016 23:19:56 +0100, Luca Ceresoli wrote:
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ---
>>  support/legal-info/README.header | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This patch is still in the queue, but no longer applies on master. Can
> you respin, if it is still needed?

It never applied on master! :) It only applies on top of Yann's legal
series (it would be useless on master anyway). Thus it is not even
outdated, it is not _yet_ applicable...

I explained that in the cover letter, but now I realize I should have
done it [also] in notes to the patch itself as the cover letter is not
visible from patchwork. Will think about it next time.

Yann, since this patch is actually a completion to your legal series,
and since is cleanly applies on top of it, you might want to take it as
part of your series. Otherwise I'll resend when your legal series will
be applied.

-- 
Luca
