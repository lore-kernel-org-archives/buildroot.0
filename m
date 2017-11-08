From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 11:43:48 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: no longer require openssl
In-Reply-To: <20171107212906.31336-1-Adamduskett@outlook.com>
References: <20171107212906.31336-1-Adamduskett@outlook.com>
Message-ID: <20171108114348.491097e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Nov 2017 16:29:06 -0500, Adam Duskett wrote:
> 4.2.8p10 no longer requires openssl to compile.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Peter: I'm wondering if we should apply this to next or master. It is
not a bug fix per-se, but it fixes a kind of regression introduced with
the bump of ntp to 4.2.8p9, which was merged in 2017.02, and brought in
OpenSSL as a mandatory dependency. A user reported on Github that it
increased quite a lot the installed size (due to the additional OpenSSL
dependency).

So, I'm tempted to apply this to master. Peter, are you OK?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
