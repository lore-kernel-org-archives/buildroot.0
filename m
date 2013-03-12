From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 18:46:26 +0100
Subject: [Buildroot] [PATCH 6/6] fs/ext2: remove count- and time-based
	fsck
In-Reply-To: <20da59bb44bf9f9331f343a2c7308b7aaa5cb834.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <20da59bb44bf9f9331f343a2c7308b7aaa5cb834.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <513F69F2.9050908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/13 23:04, Yann E. MORIN wrote:
> Set the count- and time-based checks intervals to 0, thus
> effectively disabling automatic checks at boot.
>
> (After a suggestion by Arnout.)
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle<arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
