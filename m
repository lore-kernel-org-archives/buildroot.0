From: Paulo Matos <pmatos@igalia.com>
Date: Wed, 29 May 2019 08:54:17 +0200
Subject: [Buildroot] board/ci20 uboot problems due to fdt headers
In-Reply-To: <230c7762-612e-6d59-5b5b-930d56a8df32@mind.be>
References: <8811f1b8-8019-912c-a54a-331aabcedbd1@igalia.com>
 <230c7762-612e-6d59-5b5b-930d56a8df32@mind.be>
Message-ID: <79a7e587-214c-3a9e-b846-c88bccc06c83@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2019 20:22, Arnout Vandecappelle wrote:
>
>  Indeed, it was fixed by commit bf733342324 and its follow-up f437bf547c. Which
> Buildroot version are you using? Anything more recent than 2018.02.1 should no
> longer have this issue.
>


Apologies for not mentioning it but I am using tip of master, which is
why I was surprised when I saw this error come up again. Not doing
anything special.

On arch `pacman -Ss dtc` installs /usr/include/libfdt.h, which seems to
conflict with the ones from uboot.

Should I report this?

Regards,
-- 
Paulo Matos
