From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 29 Jan 2014 09:39:38 +0100 (CET)
Subject: [Buildroot] generating the map file
In-Reply-To: <OF622178ED.DD9A35DB-ON85257C62.00673408-85257C62.006749F5@LocalDomain>
Message-ID: <371927488.4844376.1390984778154.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As far as I understand, map files (or memory map files) are a 
representation of the memory space of a single application

It makes sense to have a "complete memory map" when you have 
a single application running on your system (typically a microcontroler)

when you have a machine with a MMU i'm not sure it makes much 
sense... you can have a memory map for the kernel, a memory map for each
application, but i'm not sure what a memory map for the complete
buildroot build would be...

maybe if you use an initrd and have your whole FS in ram ? but even in
that case i'm not convinced that makes sense...

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75013 Paris - France
www.openwide.fr





----- Mail original -----
> 
> Hi,
> 
> Can someone provide inputs on how to generate the .map file for the
> entire build (from buildroot).
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
