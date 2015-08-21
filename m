From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 21 Aug 2015 15:41:35 +0200 (CEST)
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain
	CONFIG_*	is set
In-Reply-To: <20150821132227.GA3753@free.fr>
Message-ID: <2138056712.6231153.1440164495115.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On a related note (mainly to fuel ideas) Denis posted the following
patch a couple of weeks ago...

http://lists.busybox.net/pipermail/buildroot/2015-August/135321.html

This patch is integrated in pkg-kconfig and "transforms" all kconfig
variables into makefile variables. These variables can then be
used from any package to test for available options...


Just pointing out a different approch to the same problem


Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 13

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75013 Paris - France
www.openwide.fr
