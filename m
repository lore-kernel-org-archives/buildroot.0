From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 22:00:47 +0100
Subject: [Buildroot] [PATCH 0/5] support/docker: generate reproducible
 base images
In-Reply-To: <cover.1517755438.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 4 Feb 2018 15:44:22 +0100")
References: <cover.1517755438.git.yann.morin.1998@free.fr>
Message-ID: <87vafcwjuo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > Currently, we only ever refer to the "latest" version of the image.
 > This is not nice because:
 >   1. this is not reproducible;
 >   2. we can't have different images between master and the various
 >      maintenance branches.

 > So, this series makes the generated image reproducible, and explains how
 > to gnerate and push a tagged image.

 > Once this series has been applied, we'll have to generate such a tagged
 > image and update our .gitlab-ci.yml accordingly.

Committed series, thanks - You are now officially our Docker expert ;)

-- 
Bye, Peter Korsgaard
