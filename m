From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 23 Mar 2015 14:08:14 +0100
Subject: [Buildroot] [PATCH 5/7 v3] support/download: properly catch
 missing hashes
In-Reply-To: <ba2046d72b5e7f4de0bec7179fe328f6f611415a.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <ba2046d72b5e7f4de0bec7179fe328f6f611415a.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKj9umtOzD0YLxz7n8zON22kmYzFcgEVyHKRtBgXWG9zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 22, 2015 at 4:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> When checking hashes reports no hash for a file, and this is treated as
> an error (now: because BR2_ENFORCE_CHECK_HASH is set; later: because
> that will be the new and only behaviour), exit promptly in error.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
