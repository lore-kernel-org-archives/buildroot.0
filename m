From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 17 Jan 2013 09:14:14 +0100 (CET)
Subject: [Buildroot] [PATCH 1/5] Add a post-image script mechanism
In-Reply-To: <201301162306.02062.yann.morin.1998@free.fr>
Message-ID: <4ef35cb0-9ebd-48bb-803d-73b843f4e26d@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think we have two different use cases here...


* we need a hook within fakeroot to make multiple images when each image is a different partition

* we need a hook post-image to bundle multiple images into a single binary files

that's a lot of hook, but i'm not sure how to not have all of them... 

    Regards

    J?r?my Rosen

fight key loggers : write some perl using vim
