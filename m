From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Mar 2013 18:45:32 +0100
Subject: [Buildroot] [PATCH v4 2/2] zeromq: add PGM/EPGM support
In-Reply-To: <1362390492-22434-2-git-send-email-alexander.lukichev@gmail.com>
References: <1362390492-22434-1-git-send-email-alexander.lukichev@gmail.com>
 <1362390492-22434-2-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <20130311184532.646b19ec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

On Mon,  4 Mar 2013 11:48:12 +0200, Alexander Lukichev wrote:
> This adds support for Pragmatic General Multicast protocol on raw
> IP (PGM, RFC 3208) or UDP frames (EPGM) for use as zeromq reliable
> multicast transport. The library relies on openpgm package to
> implement the protocol itself.
> 
> Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
