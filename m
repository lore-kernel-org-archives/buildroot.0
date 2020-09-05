From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 14:27:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: disable zstd for
 host-systemd
In-Reply-To: <20200904152633.198288-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Fri, 4 Sep 2020 17:26:33 +0200")
References: <20200904152633.198288-1-titouan.christophe@railnova.eu>
Message-ID: <87k0x8jtmt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > systemd 246 added support for zstd compression of large fields in
 > journal files [1]. Since zstd is only used at runtime, we don't
 > need it to enable its support in host-systemd.

 > [1] https://github.com/systemd/systemd/blob/v246/NEWS#L323-L331

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
