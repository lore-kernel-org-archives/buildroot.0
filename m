From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 17:50:48 +0200
Subject: [Buildroot] [PATCH v2] sconeserver: new package
In-Reply-To: <5017F78E.4010004@mind.be>
References: <1343382707-2698-1-git-send-email-spdawson@gmail.com>
 <5017F78E.4010004@mind.be>
Message-ID: <20120731175048.6a4ac265@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 31 Jul 2012 17:19:42 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   And another thing: this should have a
> select BR2_PACKAGE_XORG7

Or rather a "depends on":

thomas at skate:~/projets/buildroot$ git grep "select BR2_PACKAGE_XORG7" | wc -l
0
thomas at skate:~/projets/buildroot$ git grep "depends on BR2_PACKAGE_XORG7" | wc -l
37

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
