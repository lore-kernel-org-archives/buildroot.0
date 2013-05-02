From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 02 May 2013 09:30:42 +0200
Subject: [Buildroot] [PATCH v2 3/3] rootfs-overlay: use a make foreach
 instead of a shell for
In-Reply-To: <517FF854.9090903@mind.be>
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
 <1365439816-6935-4-git-send-email-luca@lucaceresoli.net>
 <517FF854.9090903@mind.be>
Message-ID: <51821622.4080306@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle wrote:
> On 08/04/13 18:50, Luca Ceresoli wrote:
>> Makes the code uniform with the post-build and post-image implementation
>> (which is slightly simpler and, presumably, more efficient).
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  I thought about the possibility to refactor these three use cases 
> into a single make function, but it would actually just complicate 
> things.

I considered this as well, but for so few lines it would be overkill.

Thanks for your review,
Luca
