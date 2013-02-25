From: Francesco Montorsi <francesco.montorsi@gmail.com>
Date: Mon, 25 Feb 2013 13:46:00 +0000 (UTC)
Subject: [Buildroot] force buildroot to regenerate the output/target
	directory tree
Message-ID: <loom.20130225T144049-821@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've been using buildroot since some time and there is a thing I didn't figure 
out yet. Consider this situation: I have a working buildroot environment; I have 
copied into the output/target folder some stuff so that when I run "make" 
buildroot generates for me images into output/images which already contain the 
contents I manually copied.
Now I would like to "reset" the output/target folder, i.e. obtain the buildroot 
"vanilla" output/target tree and to obtian the buildroot vanilla 
output/images.... how can I do that without doing a "make clean" (which requires 
re-compilation of all packages and takes a lot of time)? 

does a "rm -rf output/target && make" works? 


Thanks!
Francesco
