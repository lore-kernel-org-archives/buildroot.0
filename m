From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 17:38:25 +0200
Subject: [Buildroot] [PATCH 1/2] kmscube: Change repository to gitlab
In-Reply-To: <20200401201455.GX22325@scaer> (Yann E. MORIN's message of "Wed, 
 1 Apr 2020 22:14:55 +0200")
References: <20200401170504.9307-1-festevam@gmail.com>
 <20200401201455.GX22325@scaer>
Message-ID: <87mu7taoem.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabio, All,
 > On 2020-04-01 14:05 -0300, Fabio Estevam spake thusly:
 >> The https://cgit.freedesktop.org/mesa/kmscube repository
 >> is mirrored from https://gitlab.freedesktop.org/mesa/kmscube, so
 >> switch to the gitlab one. 
 >> 
 >> The other advantage of using the gitlab repository is that it can handle
 >> archive downloads, so switch to it.
 >> 
 >> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
 >> Signed-off-by: Fabio Estevam <festevam@gmail.com>

 > Both applied to master, thanks.

NIT: The subject prefix should be package/kmscube, not just kmscube.

-- 
Bye, Peter Korsgaard
