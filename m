From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 23:08:58 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/freeswitch: new package
In-Reply-To: <1443730534-12501-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443730534-12501-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151222230858.4bc51ff8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Thu,  1 Oct 2015 22:15:34 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

A few days after you sent this patch, Luca did a pretty extensive
review of it. One of his comments (amongst others) is that it should be
split into several simpler patches, the first one adding a minimal
freeswitch package, and then additional patches adding more and more
optional functionalities.

Could you rework this patch in this direction?

In the mean time, I will mark this patch as "Changes Requested" in
patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
