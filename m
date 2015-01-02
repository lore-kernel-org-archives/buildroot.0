From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 02 Jan 2015 19:11:39 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "dhcpcd: blacklist Sourcery
 PowerPC toolchains"
In-Reply-To: <1420216745-24218-2-git-send-email-luca@lucaceresoli.net>
References: <1420216745-24218-1-git-send-email-luca@lucaceresoli.net>
 <1420216745-24218-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <54A6DF5B.2030209@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, All,

Luca Ceresoli wrote:
> This reverts commit dfbfa6ef00ed32127bf01f5b4f525889921c3006
> ("dhcpcd: blacklist Sourcery PowerPC toolchains").
>
> Blacklisting those toolchains is not useful anymore, since a patch for
> dhcpcd 6.6.7 fixed the issue.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Ouch, this should be instead:
Cc: Baruch Siach <baruch@tkos.co.il>

Sorry, that was a silly copy-paste mistake!

-- 
Luca
