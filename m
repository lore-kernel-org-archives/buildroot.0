From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Feb 2020 19:18:15 +0100
Subject: [Buildroot] [PATCH 3/6 v2] boot/uboot: license files hashes
 only valid for latest version
In-Reply-To: <75edead37a0d9c4d78b3d03739bbfab1f35ee3a6.1580914115.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 5 Feb 2020 15:48:40 +0100")
References: <cover.1580914115.git.yann.morin.1998@free.fr>
 <75edead37a0d9c4d78b3d03739bbfab1f35ee3a6.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <87ftfnzijc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We can only know the path to the license files for the known version.
 > For custom, older or newer, versions may change, or may be moved
 > around.

It is not only the path, but also the content (hash), so I slightly
reworded this and committed, thanks.

-- 
Bye, Peter Korsgaard
