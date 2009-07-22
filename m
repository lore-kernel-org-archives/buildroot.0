From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2009 16:46:16 +0200
Subject: [Buildroot] checking for XFT... configure: error: *** Required
 xft Librarys not found ***
In-Reply-To: <711BBECDEF81BA439A6038E213C1DF1406E16ED0@ism-mail03.corp.ad.wrs.com>
References: <711BBECDEF81BA439A6038E213C1DF1406E16C93@ism-mail03.corp.ad.wrs.com>
	<20090722132039.5f5c691f@surf>
	<711BBECDEF81BA439A6038E213C1DF1406E16ED0@ism-mail03.corp.ad.wrs.com>
Message-ID: <20090722164616.279cb3b6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Jul 2009 16:13:22 +0200,
"Franchitti, Alexandre J (Alex)" <alexandre.franchitti@windriver.com> a
?crit :

> Newbie question...how do I apply a patch in buildroot ?

There's nothing specific to Buildroot here, it's just a matter of
applying a patch just like with any other source code.

Just in case you're not familiar with applying patches, here is how you
can do that in a nutshell:

 1) Fetch the patch

    wget -O matchbox-fix.patch http://git.buildroot.net/buildroot/patch/?id=51ef5b81224c243aa7f937c4690b1a120c81ccbc

 2) Go the Buildroot directory

    cd /the/path/to/your/buildroot/directory/

 3) Apply the patch

    cat /the/path/to/the/patch/matchbox-fix.path | patch -p1

Does that answer your question ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
