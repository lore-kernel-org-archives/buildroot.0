From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 15 Mar 2013 11:52:33 +0100 (CET)
Subject: [Buildroot] Learning the eclipse plugin... relocation problems
Message-ID: <1222224449.534707.1363344753688.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody

I am experimenting with the eclipse plugin and I am stumbling a bit... 

I am starting an eclipse/buildroot project that I want to share via git.

I create the project using the tutorials on the eclipse pluging page and
all works well, but when I try to share it I am not sure how to deal with
the toolchain integration

my problem is that the second user doesn't have his toolchaing located at 
the same place (it's a different user) His toolchaing is registered with
the eclispe plugin, but the path to the toolchain seems hardcoded in 
both the .cproject file and in the various .mk files.

what is the recommanded way of sharing an ecplise project ? did I miss 
something or is this a new feature that needs to be worked on ?

    Regards

    J?r?my Rosen

fight key loggers : write some perl using vim
