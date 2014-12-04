From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 04 Dec 2014 21:53:25 +0100
Subject: [Buildroot] [PATCH v3] gst1-imx: add package
In-Reply-To: <CADCpmyPecpzsdbDNp0H3YchvCGqcuVNEtu3Od0kGVnGfJiXx9Q@mail.gmail.com>
References: <1415506111-21818-1-git-send-email-bisson.gary@gmail.com>	<5460F657.8000301@lucaceresoli.net>	<54611576.3000803@gmail.com>	<5461D367.3050005@lucaceresoli.net>
 <CADCpmyPecpzsdbDNp0H3YchvCGqcuVNEtu3Od0kGVnGfJiXx9Q@mail.gmail.com>
Message-ID: <5480C9C5.1060806@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary, All,

Gary Bisson wrote:
> Let me know if there's any modification you'd like on this patch.

I haven't (that's why I gave you my Reviewed-by and Acked-by tags).

As I wrote in my first reply, I am not that happy with the absence of
kconfig comments about missing dependencies. Nevertheless I would
commit this patch, because it is an improvement anyway. Comments may
be added later if desired.

Yann, you commented on this topic in past submissions of this patch,
are you satisfied with the current approach?

Now that the stabilization month is over, hopefully this patch will
get merged. BTW, it cleanly applies on current master.

-- 
Luca
