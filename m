From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 7 Nov 2013 15:02:16 +0100 (CET)
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <87txfphzyb.fsf@dell.be.48ers.dk>
Message-ID: <1727534114.12176772.1383832936168.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

if I understand correctly, the question is

"how to build/maintain a local buildroot source mirror" 

I would imagine a local buildroot clone with the default for mirror changed from sources.buildroot.net to whatever the local mirror is

and a simple script to update from the net...

maybe a script in tools/ would make more sense...


Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75012 Paris - France
www.openwide.fr
